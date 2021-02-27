%% modify Sn
clear all
clc
ligodata = load("iLIGOSensitivity.txt");
loglog(ligodata(:,1),ligodata(:,2));
ligodata(1:33,2)=ones(33,1)*ligodata(33,2);
ligodata(1,1)=0;
ligodata(1,2)=0;
ligodata(74:81,2)=ones(81-74+1,1)*ligodata(74,2) ;
ligodata(81,1)=4096; %higher cut off 2048 Hz
%hold on
%loglog(ligodata(1:81,1),ligodata(1:81,2))

dataf=ligodata(1:81,1);
datasqrtSn = ligodata(1:81,2);

hold on
loglog(dataf,datasqrtSn,'Marker','.')
%% set target PSD
%Sampling frequency for noise realization
sampFreq = 4096*2; %Hz
%Number of samples to generate
nSamples = 16384;
%Time samples
timeVec = (0:(nSamples-1))/sampFreq;

freqVec = dataf;
psdVec = datasqrtSn.^2;
loglog(freqVec,psdVec)

%% Generate noise realization
fltrOrdr = 500;
outNoise = statgaussnoisegen(nSamples,[freqVec(:),psdVec(:)],fltrOrdr,sampFreq);

%%
% Estimate the PSD
% (Pwelch plots in dB (= 10*log10(x)); plot on a linear scale)
[pxx,f]=pwelch(outNoise, 2048*4,[],[],sampFreq);
figure;
loglog(f,pxx);
xlabel('Frequency (Hz)');
ylabel('PSD');
hold on
loglog(freqVec,psdVec);
% Plot the colored noise realization
figure;
plot(timeVec,outNoise);
%% 
[pxx,f]=pwelch(outNoise, 256,[],[],sampFreq);
figure;
plot(f,pxx);
xlabel('Frequency (Hz)');
ylabel('PSD');

