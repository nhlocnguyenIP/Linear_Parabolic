function L = zero_order(c)
    Nx = size(c,1);
    N = Nx^2;
    L = sparse(N,N);
    for i=2:Nx-1
       for j = 2:Nx-1
           ie = (j-1)*Nx + i;                                        
           L(ie, ie) = c(i,j);
       end
    end
end