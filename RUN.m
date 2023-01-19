%Omega = (-R, R)^2

R = 1;
Nx = 81;
dx = 2*R/(Nx - 1);
x = -R:dx:R;
 % define the pair (x_i, y_j) in Omega

T_final = 1;
Nt = 401;
dt = T_final/(Nt-1);
t = 0:dt:T_final;

[X, Y] = meshgrid(x);

a_1 = zeros(size(X));
a_2 = zeros(size(X));
b = zeros(size(X));
f = zeros(Nx, Nx, Nt);

g = zeros(Nx, Nx, Nt);
g_0 = zeros(Nx, Nx);
r = X.^2 + Y.^2;
r0 = 0.3^2;
I =find(r < r0);
g_0(I) = exp(r(I)./(r(I) - r0));

u = Parabolic_Dir(X, Y, t, a_1, a_2, b, f, g, g_0);




%u = Elliptic_Neu(X, Y, a, b, c, f, g);
% d = 8;
% u = Elliptic_Robin(X, Y, a, b, c, f, d, g);
figure;
surf(u(:,:,10),'EdgeColor','none');
colorbar;
% 
% u_true = X.^2 + Y;
% figure;
% surf(u_true - u,'EdgeColor','none');
% colorbar;
% set(gca,'fontsize',20);
