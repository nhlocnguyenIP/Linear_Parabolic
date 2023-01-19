function u = Elliptic_Dir(X, Y, a, b, c, f, g)
    %Solve the equation 
    % (u_xx + u_yy) + a u_x + b u_y + c u = f in Omega
    %With u = g on the boundary of Omega

    Nx = size(X,1);
    D = LaplaceOperator(X) + Diff_x(a, X) + Diff_y(b, X) + zero_order(c);
    f_lu = InteriorLineUp(f);

    
    [Dir, g_lu] = Dirichlet_Operator(g);
    LHS = [D;Dir];
    RHS = [f_lu;g_lu];
    u_lu = (LHS'*LHS)\(LHS'*RHS);
    u = reshape(u_lu,Nx,Nx);
    
end