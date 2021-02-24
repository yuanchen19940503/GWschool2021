samf = 1024;
samN = 2048;
samt = (0:( samN-1))/samf;

strain = mystrain_gbd(0.1 , 0.1 , Sig_chirp(samt , 5 , [1,2,3]) , 0)

plot(samt , strain)