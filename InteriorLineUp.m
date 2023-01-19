function f_lu = InteriorLineUp(f)
    Nx = size(f,1);
    N = Nx^2;    
    f_lu = zeros(N,1);
    for i=2:Nx-1
       for j = 2:Nx-1
           ie = (j-1)*Nx + i;                                        
           f_lu(ie) = f(i,j);
       end
    end
end