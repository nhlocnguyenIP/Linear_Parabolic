function L = Diff_x(a, X)
    Nx = size(X,1);
    N = Nx^2;
    dx = X(2,2) - X(1,1);
    L = sparse(N,N);
    for i=2:Nx-1
       for j = 2:Nx-1
           ie = (j-1)*Nx + i;            
           ie1 = (j -1)*Nx + i + 1;            
           L(ie, ie1) = a(i,j)/dx;
           L(ie, ie) = -a(i,j)/dx;
       end
    end
end