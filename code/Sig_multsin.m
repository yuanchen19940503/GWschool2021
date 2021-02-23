function sig = Sig_multsin(ts , As , fs)
% s = Sig_multsin(t,A,f) generates a signal such that s =
% A[i]*sin(2*pi*f[i]*t) and sum over i. This is a multiple sinasoid signal.
% As and fs are 1*n vectors and ts is the time series.
% The input As and fs should have the same length, otherwise return 0.

%Chen Yuan 2021-2-23
result=0
if length(As) == length(fs)
   for i = 1 : length(As)
    result = As(i)*sin(2*pi*fs(i)*ts)+result
   end
   sig = result
else
    sig = 0
end