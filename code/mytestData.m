%% preparasion
clear all
clc
data = load("testData.txt");
times = data(:,1);
sigs  = data(:,2);
sampFreq = (length(data)-1)/(times(end)-times(1));
Nsamp = length(data);
freqVec = 0:0.1:0.5*sampFreq;
figure;
plot(times, sigs)
%% The spectrogram before whitening
figure;
[S,fre,time]=spectrogram(sigs, 256,250,[],sampFreq);
imagesc(time,fre,abs(S));
axis xy;
%% estimate PSD from t=0 to t=5 (the 5120th point)
[pxx,f]=pwelch(sigs(1:5120), 256,[],[],sampFreq);
figure;
plot(f,pxx);
xlabel('Frequency (Hz)');
ylabel('PSD');

fltrOrdr=500
freqVec = f
sqrtPSD = sqrt(pxx);
b = fir2(fltrOrdr,freqVec/(sampFreq/2),sqrtPSD);

indata = sigs
outdata = sqrt(sampFreq)*fftfilt(b,indata);

figure
plot(times, outdata)
%% The spectrogram after whitening
figure;
[S1,fre1,time1]=spectrogram(outdata, 256,250,[],sampFreq);
imagesc(time1,fre1,abs(S1));
axis xy;
