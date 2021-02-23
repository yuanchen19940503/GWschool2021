function sig = Sig_chirp(ts , Amplitude , phicoef)
% s = Sig_chirp(t,A,phicoef) generates a chirp signal vector such that A*sin[2*pi*phi(t)] where phi is a
% function of time given by phi(t)=a[1]*t+a[2]*t^2+...+a[n]*t^n
% t is the time series; A is the amplitude of the signal and phicoef is a
% 1*n vector concerning the coefficients of a[i]

%Chen Yuan 2021-2-23

result=0
for i = 1 : length(phicoef)
    result = phicoef(i)*ts.^i+result
end
sig = Amplitude*sin(2*pi*result)