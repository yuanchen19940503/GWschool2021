function [] = myf_tensor(thetas , phis)

%body
nx=[1,0,0];
ny=[0,1,0];

D = 0.5*(nx'*nx - ny'*ny);

[T,P] = meshgrid(thetas,phis);
X = sin(T).*cos(P);
Y = sin(T).*sin(P);
Z = cos(T);
% the matrix T & P is of length(phis)*length(thetas)
f_plus=T.^0;
f_cross=T.^0;
for i = 1: length(phis)
    for j = 1:length(thetas)
        n=[sin(T(i,j)).*cos(P(i,j)) , sin(T(i,j)).*sin(P(i,j)) , cos(T(i,j))];
        x = vcrossprod([0,0,1],n)/norm(vcrossprod([0,0,1],n));
        y = vcrossprod(x , n) / norm(vcrossprod(x , n));
        eplus = x'*x - y'*y;
        ecross= x'*y + y'*x;
        f_plus(i,j) = sum(eplus(:).*D(:));
        f_cross(i,j)= sum(ecross(:).*D(:));
    end
end

surf(X,Y,Z,abs(f_plus))
shading interp;
axis equal;
colorbar

figure
surf(X,Y,Z,abs(f_cross))
shading interp;
axis equal;
colorbar