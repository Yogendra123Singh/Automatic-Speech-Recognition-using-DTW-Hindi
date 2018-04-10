% Save mfcc values Hindi Dataset 

all clear; 
clc
disp('Read Input File.\n');
fname = 'G:\Matlab\bin\Mtech Project\Hindi Dataset\wav\bathref_003.wav';
[y,fy] = audioread(fname);
u = mfcc(y,fy);
% Read all file name from directory
MyFolderInfo = dir('G:\Matlab\bin\Mtech Project\Hindi Dataset\wav');
N = size(MyFolderInfo);
%--------------------------------------------------------------------------
%Split into frame
au=myAudioRead(fname);y=au.signal; fs=au.fs; nbits=au.nbits;
y=y*2^nbits/2;
time=(1:length(y))/fs;
frameSize=256;
overlap=128;
index1=1;
index2=index1+frameSize-1;
frameMat=enframe(au.signal, frameSize, overlap);
y2=y(index1:index2);
sound(y2,fs);

%--------------------------------------------------------------------------
% for i=3:N
%     filename = MyFolderInfo(i).name;
%     name = strcat('G:\Matlab\bin\Mtech Project\Hindi Dataset\wav\',filename);
%     [s, fs] = audioread(name);
%     v = mfcc(s, fs);
%     [Dist,D,k,w] = dtw(u,v);
%     try
%         load Distancedata
%         Distance = [Distance,Dist];
%         save Distancedata Distance
%     catch
%         Distance = {Dist};
%         save Distancedata Distance
%     end
% end
% load Distancedata
%--------------------------------------------------------------------------
% index = min(Distance);
% fileID = fopen('G:\Matlab\bin\Mtech Project\Hindi Dataset\speech2text\bathref.txt','r');
% fprintf(fileID,'%s\n',index);
% fclose(fileID);


