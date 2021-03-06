clear all;
addpath Basic_Processing_Functions;

filenameSail = "./GENERATED_DATA/TestFlight_Aug30_19/Sail3/GPSLOG00_TimeConvert_Sorted_GPS3VectPos.txt";
filenameGond = "./GENERATED_DATA/TestFlight_Aug30_19/Gondola3/GPSLOG01_TimeConvert_Sorted_GPS3VectPos.txt";
filenameSailMagw = "./GENERATED_DATA/TestFlight_Aug30_19/Sail3/AODATA00_TimeConvert_Sorted_magGravMatrix.txt";
filenameGondMagw = "./GENERATED_DATA/TestFlight_Aug30_19/Gondola3/AODATA01_TimeConvert_Sorted_magGravMatrix.txt";

inputFIDSail = fopen(filenameSail,'r');
inputFIDGond = fopen(filenameGond,'r');
inputFIDSailMagw = fopen(filenameSailMagw,'r');
inputFIDGondMagw = fopen(filenameGondMagw,'r');

lineSail = fgetl(inputFIDSail);
lineGond = fgetl(inputFIDGond);
lineSailMagw = fgetl(inputFIDSailMagw);
lineGondMagw = fgetl(inputFIDGondMagw);

i = 0;
j = 0;
a = 0;
b = 0;
while ischar(lineSail) || ischar(lineGond) || ischar(lineSailMagw) || ischar(lineGondMagw)
    commaIndex = strfind(lineSail,",");
    if (size(commaIndex,2) > 2)
        commonTime = str2double(extractBefore(lineSail,commaIndex(1)));
        x = str2double(extractAfter(extractBefore(lineSail,commaIndex(2)),commaIndex(1)));
        y = str2double(extractAfter(extractBefore(lineSail,commaIndex(3)),commaIndex(2)));
        z = str2double(extractAfter(lineSail,commaIndex(3)));
        if ~isnan(commonTime) && ~isnan(x) && ~isnan(y) && ~isnan(z)
            i = i + 1;
            postionSail(i,:) = [commonTime x y z];
        end
    end
    
    commaIndex = strfind(lineGond,",");
    if (size(commaIndex,2) > 2)
        commonTime = str2double(extractBefore(lineGond,commaIndex(1)));
        x = str2double(extractAfter(extractBefore(lineGond,commaIndex(2)),commaIndex(1)));
        y = str2double(extractAfter(extractBefore(lineGond,commaIndex(3)),commaIndex(2)));
        z = str2double(extractAfter(lineGond,commaIndex(3)));
        if ~isnan(commonTime) && ~isnan(x) && ~isnan(y) && ~isnan(z)
            j = j + 1;
            postionGond(j,:) = [commonTime x y z];
        end
    end
    
    
    colonIndex = strfind(lineSailMagw,":");
    if (size(colonIndex,2) > 2)
        
        commonTime = str2double(extractBefore(lineSailMagw,colonIndex(1)));
        magw1 = extractAfter(extractBefore(lineSailMagw,colonIndex(2)),colonIndex(1));
        magw2 = extractAfter(extractBefore(lineSailMagw,colonIndex(3)),colonIndex(2));
        magw3 = extractAfter(lineSailMagw,colonIndex(3));
        commaIndex1 = strfind(magw1,",");
        commaIndex2 = strfind(magw2,",");
        commaIndex3 = strfind(magw3,",");
        
        if (size(commaIndex1,2) > 1) && (size(commaIndex2,2) > 1) && (size(commaIndex3,2) > 1)
        
            madw11 = str2double(extractBefore(magw1,commaIndex1(1)));
            madw12 = str2double(extractAfter(extractBefore(magw1,commaIndex1(2)),commaIndex1(1)));
            madw13 = str2double(extractAfter(magw1,commaIndex1(2)));
            madw21 = str2double(extractBefore(magw2,commaIndex2(1)));
            madw22 = str2double(extractAfter(extractBefore(magw2,commaIndex2(2)),commaIndex2(1)));
            madw23 = str2double(extractAfter(magw2,commaIndex2(2)));
            madw31 = str2double(extractBefore(magw3,commaIndex3(1)));
            madw32 = str2double(extractAfter(extractBefore(magw3,commaIndex3(2)),commaIndex3(1)));
            madw33 = str2double(extractAfter(magw3,commaIndex3(2)));
            
            if ~isnan(commonTime) && ~isnan(madw11) && ~isnan(madw12) && ~isnan(madw13) && ~isnan(madw21) && ~isnan(madw22) && ~isnan(madw23) && ~isnan(madw31) && ~isnan(madw32) && ~isnan(madw33)
                a = a + 1;
                sailmagwTime(a,:) = commonTime;
                sailmagwBCO(a,:,:) = [madw11 madw12 madw13 ; madw21 madw22 madw23 ; madw31 madw32 madw33];
            end
        end
    end
    
    colonIndex = strfind(lineGondMagw,":");
    if (size(colonIndex,2) > 2)
        
        commonTime = str2double(extractBefore(lineGondMagw,colonIndex(1)));
        magw1 = extractAfter(extractBefore(lineGondMagw,colonIndex(2)),colonIndex(1));
        magw2 = extractAfter(extractBefore(lineGondMagw,colonIndex(3)),colonIndex(2));
        magw3 = extractAfter(lineGondMagw,colonIndex(3));
        commaIndex1 = strfind(magw1,",");
        commaIndex2 = strfind(magw2,",");
        commaIndex3 = strfind(magw3,",");
        
        if (size(commaIndex1,2) > 1) && (size(commaIndex2,2) > 1) && (size(commaIndex3,2) > 1)
        
            madw11 = str2double(extractBefore(magw1,commaIndex1(1)));
            madw12 = str2double(extractAfter(extractBefore(magw1,commaIndex1(2)),commaIndex1(1)));
            madw13 = str2double(extractAfter(magw1,commaIndex1(2)));
            madw21 = str2double(extractBefore(magw2,commaIndex2(1)));
            madw22 = str2double(extractAfter(extractBefore(magw2,commaIndex2(2)),commaIndex2(1)));
            madw23 = str2double(extractAfter(magw2,commaIndex2(2)));
            madw31 = str2double(extractBefore(magw3,commaIndex3(1)));
            madw32 = str2double(extractAfter(extractBefore(magw3,commaIndex3(2)),commaIndex3(1)));
            madw33 = str2double(extractAfter(magw3,commaIndex3(2)));
           
            if ~isnan(commonTime) && ~isnan(madw11) && ~isnan(madw12) && ~isnan(madw13) && ~isnan(madw21) && ~isnan(madw22) && ~isnan(madw23) && ~isnan(madw31) && ~isnan(madw32) && ~isnan(madw33)
                b = b + 1;
                gondmagwTime(b,:) = commonTime;
                gondmagwBCO(b,:,:) = [madw11 madw12 madw13 ; madw21 madw22 madw23 ; madw31 madw32 madw33];
            end
        end
    end
    
    lineSail = fgetl(inputFIDSail);
    lineGond = fgetl(inputFIDGond);
    lineSailMagw = fgetl(inputFIDSailMagw);
    lineGondMagw = fgetl(inputFIDGondMagw);
end
%%
clear mov;
GondTime_lo = postionGond(1,1);
GondTime_hi = postionGond(j,1);
SailTime_lo = postionSail(1,1);
SailTime_hi = postionSail(i,1);
GondMagwTime_lo = gondmagwTime(1,:);
GondMagwTime_hi = gondmagwTime(b,:);
SailMagwTime_lo = sailmagwTime(1,:);
SailMagwTime_hi = sailmagwTime(a,:);
TimeStartVid = 67230;
TimeEndVid = 67670;
ylim_lo = min([min(postionGond(:,2)),min(postionSail(:,2))]);
ylim_hi = max([max(postionGond(:,2)),max(postionSail(:,2))]);
xlim_lo = -78.6630;
xlim_hi = -78.6613;
% xlim_lo = min([min(postionGond(:,3)),min(postionSail(:,3))]);
% xlim_hi = max([max(postionGond(:,3)),max(postionSail(:,3))]);
zlim_lo = min([min(postionGond(:,4)),min(postionSail(:,4))]);
zlim_hi = max([max(postionGond(:,4)),max(postionSail(:,4))]);

basisScale_x = (xlim_hi - xlim_lo) / 10;
basisScale_y = (ylim_hi - ylim_lo) / 10;
basisScale_z = (zlim_hi - zlim_lo) / 10;

ylim_lo = ylim_lo - basisScale_y;
ylim_hi = ylim_hi + basisScale_y;
xlim_lo = xlim_lo - basisScale_x;
xlim_hi = xlim_hi + basisScale_x;
zlim_lo = zlim_lo - basisScale_z;
zlim_hi = zlim_hi + basisScale_z;

l = 1;
m = 1;
n = 1;
p = 1;
frame = 0;
fig1 = figure;

% fig1.PaperPositionMode = 'manual';
% fig1.PaperPosition = fig1.Position;
for k = TimeStartVid:0.2:TimeEndVid
    frame = frame + 1;
    while postionSail(l,1) < k
        l = l + 1;
    end
    while postionGond(m,1) < k
        m = m + 1;
    end
    while gondmagwTime(n,1) < k && n < b
        n = n + 1;
    end
    while sailmagwTime(p,1) < k && p < a
        p = p + 1;
    end
    
    if n < b || (gondmagwTime(n,1) < k + .2 && gondmagwTime(n,1) > k - .2)
        GondBcO(:,:) = gondmagwBCO(n,:,:);
        GondBasisX_A = [1 0 0];
        GondBasisY_A = [0 1 0];
        GondBasisZ_A = [0 0 1];
        if n > 1
            n = n - 1;
        end
    else
        GondBcO = gondmagwBCO(n,:,:);
        GondBasisX_A = [0 0 0];
        GondBasisY_A = [0 0 0];
        GondBasisZ_A = [0 0 0];
    end
    
    if p < a || (sailmagwTime(p,1) < k + .2 && sailmagwTime(p,1) > k - .2)
        SailBcO(:,:) = sailmagwBCO(p,:,:);
        SailBasisX_A = [1 0 0];
        SailBasisY_A = [0 1 0];
        SailBasisZ_A = [0 0 1];
        if p < 1
            p = p-1;
        end
    else
        SailBcO = sailmagwBCO(p,:,:);
        SailBasisX_A = [0 0 0];
        SailBasisY_A = [0 0 0];
        SailBasisZ_A = [0 0 0];
    end
    
    BcA = [0 -1 0; -1 0 0 ; 0 0 -1];
    GondOcB = transpose(GondBcO);
    SailOcB = transpose(SailBcO);
    
    GondBasisX_B = BcA*transpose(GondBasisX_A);
    GondBasisY_B = BcA*transpose(GondBasisY_A);
    GondBasisZ_B = BcA*transpose(GondBasisZ_A);
    
    SailBasisX_B = BcA*transpose(SailBasisX_A);
    SailBasisY_B = BcA*transpose(SailBasisY_A);
    SailBasisZ_B = BcA*transpose(SailBasisZ_A);
    
%     GondBasisX_O = transpose(GondOcB*(GondBasisX_B));
%     GondBasisY_O = transpose(GondOcB*(GondBasisY_B));
%     GondBasisZ_O = transpose(GondOcB*(GondBasisZ_B));
%     
%     SailBasisX_O = transpose(SailOcB*(SailBasisX_B));
%     SailBasisY_O = transpose(SailOcB*(SailBasisY_B));
%     SailBasisZ_O = transpose(SailOcB*(SailBasisZ_B));

    GondBasisX_O = transpose(GondBcO*(GondBasisX_B));
    GondBasisY_O = transpose(GondBcO*(GondBasisY_B));
    GondBasisZ_O = transpose(GondBcO*(GondBasisZ_B));
    
    SailBasisX_O = transpose(SailBcO*(SailBasisX_B));
    SailBasisY_O = transpose(SailBcO*(SailBasisY_B));
    SailBasisZ_O = transpose(SailBcO*(SailBasisZ_B));
    
    basisScale_x = basisScale_x * 20;
    basisScale_y = basisScale_y * 20;
    basisScale_z = basisScale_z * 20;
    
    GondBasisX_O_Scaled = [(basisScale_x*GondBasisX_O(1)) (basisScale_y*GondBasisX_O(2)) (basisScale_z*GondBasisX_O(3))];
    GondBasisY_O_Scaled = [(basisScale_x*GondBasisY_O(1)) (basisScale_y*GondBasisY_O(2)) (basisScale_z*GondBasisY_O(3))];
    GondBasisZ_O_Scaled = [(basisScale_x*GondBasisZ_O(1)) (basisScale_y*GondBasisZ_O(2)) (basisScale_z*GondBasisZ_O(3))];
    
    SailBasisX_O_Scaled = [(basisScale_x*SailBasisX_O(1)) (basisScale_y*SailBasisX_O(2)) (basisScale_z*SailBasisX_O(3))];
    SailBasisY_O_Scaled = [(basisScale_x*SailBasisY_O(1)) (basisScale_y*SailBasisY_O(2)) (basisScale_z*SailBasisY_O(3))];
    SailBasisZ_O_Scaled = [(basisScale_x*SailBasisZ_O(1)) (basisScale_y*SailBasisZ_O(2)) (basisScale_z*SailBasisZ_O(3))];
    
    basisScale_x = basisScale_x / 20;
    basisScale_y = basisScale_y / 20;
    basisScale_z = basisScale_z / 20;
    
    GondolaPos = [postionGond(m,3) postionGond(m,2) postionGond(m,4)];
    SailPos = [postionSail(l,3) postionSail(l,2) postionSail(l,4)];
    
    GondVectX = [GondolaPos;GondolaPos + GondBasisX_O_Scaled];
    GondVectY = [GondolaPos;GondolaPos + GondBasisY_O_Scaled];
    GondVectZ = [GondolaPos;GondolaPos + GondBasisZ_O_Scaled];
    
    SailVectX = [SailPos;SailPos + SailBasisX_O_Scaled];
    SailVectY = [SailPos;SailPos + SailBasisY_O_Scaled];
    SailVectZ = [SailPos;SailPos + SailBasisZ_O_Scaled];
    
    GondElev_Ring = [xlim_hi,ylim_lo,GondolaPos(3) ; xlim_hi,ylim_hi,GondolaPos(3) ; xlim_lo,ylim_hi,GondolaPos(3)];
    GondLat_Ring = [GondolaPos(1),ylim_lo,zlim_lo ; GondolaPos(1),ylim_hi,zlim_lo ; GondolaPos(1),ylim_hi,zlim_hi];
    GondLong_Ring = [xlim_lo,GondolaPos(2),zlim_lo ; xlim_hi,GondolaPos(2),zlim_lo ; xlim_hi,GondolaPos(2),zlim_hi];
    
    SailElev_Ring = [xlim_hi,ylim_lo,SailPos(3) ; xlim_hi,ylim_hi,SailPos(3) ; xlim_lo,ylim_hi,SailPos(3)];
    SailLat_Ring = [SailPos(1),ylim_lo,zlim_lo ; SailPos(1),ylim_hi,zlim_lo ; SailPos(1),ylim_hi,zlim_hi];
    SailLong_Ring = [xlim_lo,SailPos(2),zlim_lo ; xlim_hi,SailPos(2),zlim_lo ; xlim_hi,SailPos(2),zlim_hi];
    
    l = l - 1;
    m = m - 1;
    
    figure(fig1);
    plot3(postionSail(l-20:l+2,3), postionSail(l-20:l+2,2), postionSail(l-20:l+2,4),'-m');
    %drawnow;
    hold on;
    
    titlestring = append("Flight6 : ",string(k - TimeStartVid)," sec");
    title(titlestring)
    xlim([xlim_lo xlim_hi]);
    ylim([ylim_lo ylim_hi]);
    zlim([zlim_lo zlim_hi]);
    xlabel('longitude');
    ylabel('latitude');
    zlabel('elevation');
    grid on;
    
    
    
    plot3(postionGond(m-20:m+2,3),postionGond(m-20:m+2,2),postionGond(m-20:m+2,4),'-c');
    %drawnow;
    plot3(GondVectX(:,1),GondVectX(:,2),GondVectX(:,3),'-r');
    %drawnow;
    plot3(GondVectY(:,1),GondVectY(:,2),GondVectY(:,3),'-g');
    %drawnow;
    plot3(GondVectZ(:,1),GondVectZ(:,2),GondVectZ(:,3),'-b');
    %drawnow;
    scatter3(postionGond(m,3), postionGond(m,2), postionGond(m,4),'xk');
    %drawnow;
    plot3(GondLat_Ring(:,1),GondLat_Ring(:,2),GondLat_Ring(:,3),'-c');
    plot3(GondLong_Ring(:,1),GondLong_Ring(:,2),GondLong_Ring(:,3),'-c');
    plot3(GondElev_Ring(:,1),GondElev_Ring(:,2),GondElev_Ring(:,3),'-c');
    
    
    plot3(SailVectX(:,1),SailVectX(:,2),SailVectX(:,3),'-r');
    %drawnow;
    plot3(SailVectY(:,1),SailVectY(:,2),SailVectY(:,3),'-g');
    %drawnow;
    plot3(SailVectZ(:,1),SailVectZ(:,2),SailVectZ(:,3),'-b');
    %drawnow;
    scatter3(postionSail(l,3), postionSail(l,2), postionSail(l,4),'ok');
    plot3(SailLat_Ring(:,1),SailLat_Ring(:,2),SailLat_Ring(:,3),'-m');
    plot3(SailLong_Ring(:,1),SailLong_Ring(:,2),SailLong_Ring(:,3),'-m');
    plot3(SailElev_Ring(:,1),SailElev_Ring(:,2),SailElev_Ring(:,3),'-m');
    
    drawnow;
    
    
    mov(frame) = getframe(fig1);
    %clf(fig1)
    hold off;
end

video = VideoWriter('Flight6_video.avi');
video.FrameRate = 5;
%video.Quality = 10;
open(video);
writeVideo(video,mov);
close(video);
    
%fclose(inputFIDSail); 
%fclose(inputFIDGond);
fclose(inputFIDSailMagw);
fclose(inputFIDGondMagw);
    