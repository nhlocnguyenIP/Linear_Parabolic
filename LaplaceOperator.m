function L = LaplaceOperator(X)
    Nx = size(X,1);
    N = Nx^2;
    dx = X(2,2)-X(1,1);
    L = sparse(N,N);
    for i=2:Nx-1
       for j = 2:Nx-1
           ie = (j-1)*Nx + i; %ie <---> (i,j)
           ie1 = (j + 1-1)*Nx + i;
           ie2 = (j - 1-1)*Nx + i;
           ie3 = (j -1)*Nx + i + 1; %ie3 <---> (i+1,j)
           ie4 = (j -1)*Nx + i - 1;
           L(ie, ie1) = 1/dx^2;
           L(ie, ie2) = 1/dx^2;
           L(ie, ie3) = 1/dx^2;
           L(ie, ie4) = 1/dx^2;
           L(ie, ie) = -4/dx^2;
       end
    end
end