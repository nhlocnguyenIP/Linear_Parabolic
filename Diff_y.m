function L = Diff_y(b, X)
    Nx = size(X,1);
    N = Nx^2;
    dx = X(2,2) - X(1,1);
    L = sparse(N,N);
    for i=2:Nx-1
       for j = 2:Nx-1
           ie = (j-1)*Nx + i;            
           ie1 = (j+1 -1)*Nx + i;            
           L(ie, ie1) = b(i,j)/dx;
           L(ie, ie) = -b(i,j)/dx;
       end
    end
end