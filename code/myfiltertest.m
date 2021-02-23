% input the signal, here I use the Sig_multsin function to generate the
% signal
clear all
clc
As=[10, 5 , 2.5]; % the Amplitude
fs=[100,200,300]; % the corresponding frequency
sampFreq=1024; %sampled f
Nsamples=2048;
samt=(0:(Nsamples-1))/sampFreq % the time series
sig=Sig_multsin(samt,As,fs) % generate the signal
subplot(3,1,1)
plot(samt,sig)
xlim([0,2])
ylim([-15,15])

% Design low pass filter
filtOrdr = 30;
minf=150; %the lower f cutoff
maxf=250  %the high f cutoff
band=[minf/(sampFreq/2),maxf/(sampFreq/2)];
b = fir1(filtOrdr,band,'bandpass');
% Apply filter
filtSig = fftfilt(b,sig);

subplot(3,1,2)
plot(samt,filtSig)
xlim([0,2])
ylim([-15,15])

subplot(3,1,3)
plot(samt,sig)
hold on
plot(samt,filtSig)
xlim([0,2])
ylim([-15,15])