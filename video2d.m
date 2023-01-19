function video2d(u)
    %st = strcat('out2d.avi');
    %writerObj = VideoWriter(st); % Name it.
    %writerObj.FrameRate = 6; % How many frames per second.
    %open(writerObj); 
    cmax = max(real(u(:)));
    cmin = min(real(u(:)));

    figure
    hold off   
    for i=1:size(u,3)    
        pause(0.001);
        surf(real(u(:,:,i)),'EdgeColor','none');
        shading interp
        caxis([cmin, cmax]);
        colorbar;
        %view(2)
        axis tight 
    end 
    %close(writerObj);
end


 
