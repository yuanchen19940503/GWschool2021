function strain = mystrain_gbd(theta , phi , signal_plus ,signal_cross)
%generate the strain s(t) of a signal by a ground-based detector (assuming
%perpendicular orientation
%input the direction of the source (theta,phi)
%choose a digital signal

f_p=0.5*(1+cos(theta)^2)*cos(2*phi);
f_c=cos(theta)*sin(2*phi);

if signal_cross == 0
    strain = signal_plus*f_p;
else
    strain = signal_plus*f_p + signal_cross*f_c;
end
