function u = Parabolic_Dir(X, Y, t, a_1, a_2, b, f, g, g_0)
    % u_t = u_xx + u_yy + a_1 u_x + a_2 u_y + b u + f in Omega \times (0, T)
    % u(x, y, t) = g on \partial \Omega \times (0, T)
    % u(x, y, 0) = g_0 in Omega
    
    Nx = size(X,1);
    Nt = length(t);
    dt = t(2)-t(1);

    u = zeros(Nx, Nx, Nt);
    u(:,:,1) = g_0; 
    for it = 2:Nt
        sprintf('%d/%d',it,Nt)
        b1 = b - 1/dt;
        f1 = -u(:,:,it-1)/dt - f(:,:,it);
        w = Elliptic_Dir(X, Y, a_1, a_2, b1, f1, g(:,:,it));
        u(:,:,it) = w;
    end

end