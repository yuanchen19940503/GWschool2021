function fp = myfplot(thetas,phis)
[Theta,Phi] = meshgrid(thetas,phis);
X = sin(Theta).*cos(Phi);
Y = sin(Theta).*sin(Phi);
Z = cos(Theta);

f_plus = 0.5*(Theta.^0+cos(Theta).^2).*cos(2*Phi);
f_cross = cos(Theta).*sin(2*Phi);

surf(X,Y,Z,abs(f_plus));
shading interp;
axis equal

figure
surf(X,Y,Z,abs(f_cross));
shading interp;
axis equal