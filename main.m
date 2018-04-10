% Speech Recognition using DTW
all clear;
clc;
waveFile='G:\Matlab\bin\Mtech Project\Hindi Dataset\wav\bathref_005.wav';
au=myAudioRead(waveFile); y=au.signal; fs=au.fs;
frameSize = 256;
overlap = 128;
opt=endPointDetect('defaultOpt');
opt.method='vol';
showPlot=0;
[epInSampleIndex, epInFrameIndex, soundSegment, zeroOneVec, others] = endPointDetect(au, opt, showPlot);
[m,n] = size(soundSegment);
load('HindiDictionary.mat');
[u,v] = size(Dictionary);
for i=1:n
    beginSample = getfield(soundSegment(i), 'beginSample');
    endSample = getfield(soundSegment(i), 'endSample');
    y(beginSample:endSample);
    r = mfcc(y, fs);
    for j = 1:v
        all clear;
        s = getfield(Dictionary(j), 'mfcc');
        Dist=dtw(r,s);
        Distance(j) = Dist;
    end
end
sentance = '';
[cols,rows] = size(Distance);
for l = 1:rows
    if Distance(l) < 10
        word = getfield(Dictionary(l), 'word');
        if ~strcmp(word,'SIL')
        sentance = strcat(sentance,word);
        sentance = strcat(sentance,'_');
        end
    end
end
disp(sentance);
