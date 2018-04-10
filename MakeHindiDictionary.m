% Create Hindi Dictionary
all clear;
clc;
waveFile='G:\Matlab\bin\Mtech Project\Hindi Dataset\wav\bathref_007.wav';
au=myAudioRead(waveFile); y=au.signal; fs=au.fs;
frameSize = 256;
overlap = 128;
opt=endPointDetect('defaultOpt');
opt.method='vol';
showPlot=1;
[epInSampleIndex, epInFrameIndex, soundSegment, zeroOneVec, others] =endPointDetect(au, opt, showPlot);
[m,n] = size(soundSegment);
disp('Number of word in input signal : ');
disp(n);
for i=1:n
    beginSample = getfield(soundSegment(i), 'beginSample');
    endSample = getfield(soundSegment(i), 'endSample');
    y(beginSample:endSample);
    r = mfcc(y, fs);
    promt = 'Enter a word : ';
    str = input(promt,'s');
    dictionary = struct('mfcc',r,'word',str);
    try
        load HindiDictionary
        Dictionary = [Dictionary,dictionary];
        save HindiDictionary Dictionary
    catch
        Dictionary = dictionary;
        save HindiDictionary Dictionary
    end
end
