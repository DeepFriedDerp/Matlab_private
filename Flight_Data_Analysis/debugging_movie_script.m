    plot3(postionSail(l-20:l+2,3), postionSail(l-20:l+2,2), postionSail(l-20:l+2,4));
    drawnow;
    hold on;
    
    %titlestring = append("Flight1 : ",string(k - TimeStartVid)," sec");
    %title('Flight1')
    xlim([xlim_lo xlim_hi])
    ylim([ylim_lo ylim_hi])
    zlim([zlim_lo zlim_hi])
    xlabel('longitude')
    ylabel('latitude')
    zlabel('elevation')
    
    
    
    plot3(postionGond(m-20:m+2,3),postionGond(m-20:m+2,2),postionGond(m-20:m+2,4));
    drawnow;
    plot3(GondVectX(:,1),GondVectX(:,2),GondVectX(:,3));
    drawnow;
    plot3(GondVectY(:,1),GondVectY(:,2),GondVectY(:,3));
    drawnow;
    plot3(GondVectZ(:,1),GondVectZ(:,2),GondVectZ(:,3));
    drawnow;
    scatter3(postionGond(m,3), postionGond(m,2), postionGond(m,4),'x');
    drawnow;
    
    plot3(SailVectX(:,1),SailVectX(:,2),SailVectX(:,3));
    drawnow;
    plot3(SailVectY(:,1),SailVectY(:,2),SailVectY(:,3));
    drawnow;
    plot3(SailVectZ(:,1),SailVectZ(:,2),SailVectZ(:,3));
    drawnow;
    scatter3(postionSail(l,3), postionSail(l,2), postionSail(l,4),'x');
    drawnow;