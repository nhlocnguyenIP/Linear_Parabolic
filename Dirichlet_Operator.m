function [L, g_lu] = Dirichlet_Operator(g)
    Nx = size(g,1);    
    N = Nx^2;        
    L = sparse(N,N);
    g_lu = zeros(N,1);
    for i=[1, Nx]
       for j = 1:Nx
           ie = (j-1)*Nx + i;                                        
           L(ie, ie) = 1;
           g_lu(ie) = g(i,j);
       end
    end
    for i=2:Nx-1
       for j = [1,Nx]
           ie = (j-1)*Nx + i;                                        
           L(ie, ie) = 1;
           g_lu(ie) = g(i,j);
       end
    end
end