clear all
clc
A1=10;
A2=5;
A3=2.5;
f1=100;
f2=200;
f3=300;
phi1=0;
phi2=pi/6;
phi3=pi/4;
samt=0:1/1024:1.9999;
sig=A1*sin(2*pi*f1*samt)+A2*sin(2*pi*f2*samt)+A3*sin(2*pi*f3*samt);
subplot(2,1,1)
plot(samt,sig)


% Design low pass filter
filtOrdr = 30;
maxFreq=300;
sampFreq=1024;
minf=150;
maxf=250
band=[minf/(sampFreq/2),maxf/(sampFreq/2)];
b = fir1(filtOrdr,band,'bandpass');
% Apply filter
filtSig = fftfilt(b,sig);

subplot(2,1,2)
plot(samt,filtSig)

figure;
plot(samt,sig)
hold on
plot(samt,filtSig)