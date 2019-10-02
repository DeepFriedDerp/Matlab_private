%% SETUP FILEPATHS AND FLIGHT TIMES FROM NOTES
clear all;
addpath Basic_Processing_Functions;

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("script staring now\n");

parentFolder = "GENERATED_DATA/TestFlight_Aug30_19";
folderLevel1 = ["Gondola1" "Gondola2" "Gondola3" "Sail1" "Sail2" "Sail3" "XTRA_GND_STN"];
OtherFile = ["AODATA00" "AODATA01" "AODATA02"];
gpsFile = ["GPSLOG00" "GPSLOG01" "GPSLOG02"];
suffixOther = ["_TimeConvert_Sorted_FilteredRaw_Other3VectGyro.txt" "_TimeConvert_Sorted_FilteredRaw_otherWindspeed.txt" "_TimeConvert_Sorted_magGravMatrix.txt"];
suffixGPS = "_TimeConvert_Sorted_GPS2VectVelHeading.txt";

baseNames_OtherGryo(1,:) = append("./",parentFolder,"/",folderLevel1(1),"/",OtherFile(1),suffixOther(1));
baseNames_OtherGryo(2,:) = append("./",parentFolder,"/",folderLevel1(2),"/",OtherFile(1),suffixOther(1));
baseNames_OtherGryo(3,:) = append("./",parentFolder,"/",folderLevel1(3),"/",OtherFile(2),suffixOther(1));
baseNames_OtherGryo(4,:) = append("./",parentFolder,"/",folderLevel1(4),"/",OtherFile(1),suffixOther(1));
baseNames_OtherGryo(5,:) = append("./",parentFolder,"/",folderLevel1(5),"/",OtherFile(1),suffixOther(1));
baseNames_OtherGryo(6,:) = append("./",parentFolder,"/",folderLevel1(6),"/",OtherFile(1),suffixOther(1));

baseNames_OtherWind(1,:) = append("./",parentFolder,"/",folderLevel1(1),"/",OtherFile(1),suffixOther(2));
baseNames_OtherWind(2,:) = append("./",parentFolder,"/",folderLevel1(2),"/",OtherFile(1),suffixOther(2));
baseNames_OtherWind(3,:) = append("./",parentFolder,"/",folderLevel1(3),"/",OtherFile(2),suffixOther(2));
baseNames_OtherWind(4,:) = append("./",parentFolder,"/",folderLevel1(4),"/",OtherFile(1),suffixOther(2));
baseNames_OtherWind(5,:) = append("./",parentFolder,"/",folderLevel1(5),"/",OtherFile(1),suffixOther(2));
baseNames_OtherWind(6,:) = append("./",parentFolder,"/",folderLevel1(6),"/",OtherFile(1),suffixOther(2));

baseNames_OtherOcB(1,:) = append("./",parentFolder,"/",folderLevel1(1),"/",OtherFile(1),suffixOther(3));
baseNames_OtherOcB(2,:) = append("./",parentFolder,"/",folderLevel1(2),"/",OtherFile(1),suffixOther(3));
baseNames_OtherOcB(3,:) = append("./",parentFolder,"/",folderLevel1(3),"/",OtherFile(2),suffixOther(3));
baseNames_OtherOcB(4,:) = append("./",parentFolder,"/",folderLevel1(4),"/",OtherFile(1),suffixOther(3));
baseNames_OtherOcB(5,:) = append("./",parentFolder,"/",folderLevel1(5),"/",OtherFile(1),suffixOther(3));
baseNames_OtherOcB(6,:) = append("./",parentFolder,"/",folderLevel1(6),"/",OtherFile(1),suffixOther(3));

baseNames_GPS(1,:) = append("./",parentFolder,"/",folderLevel1(1),"/",gpsFile(1),suffixGPS);
baseNames_GPS(2,:) = append("./",parentFolder,"/",folderLevel1(2),"/",gpsFile(1),suffixGPS);
baseNames_GPS(3,:) = append("./",parentFolder,"/",folderLevel1(3),"/",gpsFile(2),suffixGPS);
baseNames_GPS(4,:) = append("./",parentFolder,"/",folderLevel1(4),"/",gpsFile(1),suffixGPS);
baseNames_GPS(5,:) = append("./",parentFolder,"/",folderLevel1(5),"/",gpsFile(1),suffixGPS);
baseNames_GPS(6,:) = append("./",parentFolder,"/",folderLevel1(6),"/",gpsFile(1),suffixGPS);

Flight_Timespans = [
    56805 57195
    57640 57940
    63340 63690
    64000 64300
    66375 66775
    67230 67670
    ];

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("fileNames have been generated!\n");

%% EXTRACT DATA FROM INPUTFILES
 for i = 1:size(baseNames_OtherGryo,1)
     fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
     fprintf("Extracting data from:\n\t~%s \n\t~%s \n\t~%s \n\t~%s \n", baseNames_OtherGryo(i,:),baseNames_OtherGryo(i,:),baseNames_OtherGryo(i,:),baseNames_GPS(i,:));
     inputFID_Gryo = fopen(baseNames_OtherGryo(i,:),'r');
     inputFID_Wind = fopen(baseNames_OtherWind(i,:),'r');
     inputFID_OcB = fopen(baseNames_OtherOcB(i,:),'r');
     inputFID_gps = fopen(baseNames_GPS(i,:),'r');
     
     GyroLineNum(i,:) = 0;
     WindLineNum(i,:) = 0;
     OcBLineNum(i,:) = 0;
     gpsLineNum(i,:) = 0;

     
     gyroLine = fgetl(inputFID_Gryo);
     windLine = fgetl(inputFID_Wind);
     OcBLine = fgetl(inputFID_OcB);
     gpsLine = fgetl(inputFID_gps);
     
     while ischar(gyroLine) || ischar(windLine) || ischar(OcBLine) || ischar(gpsLine)
         % get the gyro Info
         commaInd = strfind(gyroLine,',');
         if size(commaInd,2) > 2
             commonTime = str2double(extractBefore(gyroLine,commaInd(1)));
             gyroX = str2double(extractAfter(extractBefore(gyroLine,commaInd(2)),commaInd(1)));
             gyroY = str2double(extractAfter(extractBefore(gyroLine,commaInd(3)),commaInd(2)));
             gyroZ = str2double(extractAfter(gyroLine,commaInd(3)));
             
             if ~(isnan(commonTime) && isnan(gyroX) && isnan(gyroY) && isnan(gyroZ))
                 GyroLineNum(i,:) = GyroLineNum(i,:) + 1;
                 Gyro(i,GyroLineNum(i,:),:) = [commonTime gyroX gyroY gyroZ];
             end
         end
         gyroLine = fgetl(inputFID_Gryo);
         
         
         % get the wind Info
         if ~isnumeric(windLine)
             if contains(windLine,",")
                 commonTime = str2double(extractBefore(windLine,","));
                 windX = str2double(extractAfter(windLine,","));
                 if ~(isnan(commonTime) && isnan(windX))
                     WindLineNum(i,:) = WindLineNum(i,:) + 1;
                     Wind(i,WindLineNum(i,:),:) = [commonTime windX];
                 end
             end
         end
         windLine = fgetl(inputFID_Wind);
         
         
         % get the OcB matrix
         colonInd = strfind(OcBLine,":");
         if size(colonInd,2) > 2
             commonTime = str2double(extractBefore(OcBLine,colonInd(1)));
             row1 = extractAfter(extractBefore(OcBLine,colonInd(2)),colonInd(1));
             row2 = extractAfter(extractBefore(OcBLine,colonInd(3)),colonInd(2));
             row3 = extractAfter(OcBLine,colonInd(3));
             
             commaInd1 = strfind(row1,",");
             commaInd2 = strfind(row2,",");
             commaInd3 = strfind(row3,",");
             
             if size(commaInd1,2) > 1 && size(commaInd2,2) > 1 && size(commaInd3,2) > 1
                 OcB_11 = str2double(extractBefore(row1,commaInd1(1)));
                 OcB_12 = str2double(extractAfter(extractBefore(row1,commaInd1(2)),commaInd1(1)));
                 OcB_13 = str2double(extractAfter(row1,commaInd1(2)));
                 
                 OcB_21 = str2double(extractBefore(row2,commaInd2(1)));
                 OcB_22 = str2double(extractAfter(extractBefore(row2,commaInd2(2)),commaInd2(1)));
                 OcB_23 = str2double(extractAfter(row2,commaInd2(2)));
                 
                 OcB_31 = str2double(extractBefore(row3,commaInd3(1)));
                 OcB_32 = str2double(extractAfter(extractBefore(row3,commaInd3(2)),commaInd3(1)));
                 OcB_33 = str2double(extractAfter(row3,commaInd3(2)));
                 
                 if ~(isnan(commonTime) && isnan(OcB_11) && isnan(OcB_12) && isnan(OcB_13) && isnan(OcB_21) && isnan(OcB_22) && isnan(OcB_23) && isnan(OcB_31) && isnan(OcB_32) && isnan(OcB_33))
                     OcBLineNum(i,:) = OcBLineNum(i,:) + 1;
                     OcBTime(i,OcBLineNum(i,:),1) = commonTime;
                     OcB(i,OcBLineNum(i,:),:,:) = [
                         OcB_11 OcB_12 OcB_13
                         OcB_21 OcB_22 OcB_23
                         OcB_31 OcB_32 OcB_33
                         ];
                 end
             end
         end
         OcBLine = fgetl(inputFID_OcB);
         
         
         %get the gps info
         commaInd = strfind(gpsLine,",");
         if size(commaInd,2) > 1
             commonTime = str2double(extractBefore(gpsLine,commaInd(1)));
             velocity = str2double(extractAfter(extractBefore(gpsLine,commaInd(2)),commaInd(1)));
             heading = str2double(extractAfter(gpsLine,commaInd(2)));
             
             if ~(isnan(commonTime) && isnan(velocity) && isnan(heading))
                 gpsLineNum(i,:) = gpsLineNum(i,:) + 1;
                 gpsData(i,gpsLineNum(i,:),:) = [commonTime velocity heading];
             end
         end
         gpsLine = fgetl(inputFID_gps);
     end
     fclose(inputFID_Gryo);
     fclose(inputFID_Wind);
     fclose(inputFID_OcB);
     fclose(inputFID_gps);
 end
         
%% (MIGHT NEED) GET ANGULAR ACCELERATION
for i = 1:size(baseNames_OtherGryo,1)
    for j = 1:GyroLineNum(i,:)-1
        time1 = Gyro(i,j,1);
        gyro1 = Gyro(i,j,2:4);
        
        time2 = Gyro(i,j+1,1);
        gyro2 = Gyro(i,j+1,2:4);
        
        dt = time2 - time1;
        avgTime = mean([time1 time2]);
        dgyro = (gyro2 - gyro1) / dt;
        
        dGyroDt(i,j,:) = [avgTime dgyro(1) dgyro(2) dgyro(3)];
    end
end

%% Find Times when Gyro and Velocity are close to zero
for i = 1:size(baseNames_OtherGryo,1)
    %first the gyro stuff
    j = 1;
    k = 0;
    while j < GyroLineNum(i,:)
        time1 = Gyro(i,j,1);
        gyroVect(1:3) = [Gyro(i,j,2) Gyro(i,j,3) Gyro(i,j,4)];
        if norm([gyroVect(1) gyroVect(3)]) < sqrt(2)
            while norm([gyroVect(1) gyroVect(3)]) < sqrt(2) && j < GyroLineNum(i,:)
                j = j + 1;
                gyroVect(1:3) = [Gyro(i,j,2) Gyro(i,j,3) Gyro(i,j,4)];
            end
            j = j - 1;
            time2 = Gyro(i,j,1);
            if time1 < time2
                k = k + 1;
                lowGyro(i,k,:) = [time1 time2];
            end
        end
        j = j + 1;
    end
    
    %then the velocity stuff
    j = 1;
    k = 0;
    while j < gpsLineNum(i,:)
        time1 = gpsData(i,j,1);
        velocity = gpsData(i,j,2);
        if velocity < 0.1
            while velocity < 0.2 && j < gpsLineNum(i,:)
                j = j + 1;
                velocity = gpsData(i,j,2);
            end
            j = j - 1;
            time2 = gpsData(i,j,1);
            if time1 < time2
                k = k + 1;
                lowVelo(i,k,:) = [time1 time2];
            end
        end
        j = j + 1;
    end
end

%% FIND COMMON TIMES BETWEEN LOWGYRO AND LOWVELO
for i = 1:size(baseNames_OtherGryo,1)
    for k = 1:size(lowGyro(i,:,:),2)
        j = 0;
        t1 = lowGyro(i,k,1);
        t2 = lowGyro(i,k,2);
        for j = 1:size(lowVelo(i,:,:),2)
            t3 = lowVelo(i,j,1);
            t4 = lowVelo(i,j,2);
            if t1 < t4 && t1 >= t3
                j = j + 1;
                if t2 <= t4
                    lowMotion(i,j,:) = [t1 t2];
                else
                    lowMotion(i,j,:) = [t1 t4];
                end
            elseif t3 < t2 && t3 >= t1
                j = j + 1;
                if t4 <= t2
                    lowMotion(i,j,:) = [t3 t4];
                else
                    lowMotion(i,j,:) = [t3 t2];
                end
            end
        end
    end
end
        
%% PRINT THE LOWVELO, LOWGYRO, AND LOWMOTION DATASETS

for i = 1:size(baseNames_OtherGryo,1)
    subplot(2,3,i); 
    hold on;
    j = 1;
    gyroPlot(i,j,:) = [Gyro(i,1,1) 0];
    for k = 1:size(lowGyro(i,:,:),2)
        pt1 = lowGyro(i,k,1);
        pt2 = lowGyro(i,k,2);
        j = j + 1;
        gyroPlot(i,j,:) = [pt1 0];
        j = j + 1;
        gyroPlot(i,j,:) = [pt1 3];
        j = j + 1;
        gyroPlot(i,j,:) = [pt2 3];
        j = j + 1;
        gyroPlot(i,j,:) = [pt2 0];
    end
    
    j = 1;
    veloPlot(i,j,:) = [gpsData(i,1,1) 0];
    for k = 1:size(lowVelo(i,:,:),2)
        pt1 = lowVelo(i,k,1);
        pt2 = lowVelo(i,k,2);
        j = j + 1;
        veloPlot(i,j,:) = [pt1 0];
        j = j + 1;
        veloPlot(i,j,:) = [pt1 2];
        j = j + 1;
        veloPlot(i,j,:) = [pt2 2];
        j = j + 1;
        veloPlot(i,j,:) = [pt2 0];
    end
    
    j = 0;
    for k = 1:size(lowMotion(i,:,:),2)
        pt1 = lowMotion(i,k,1);
        pt2 = lowMotion(i,k,2);
        j = j + 1;
        commonPlot(i,j,:) = [pt1 0];
        j = j + 1;
        commonPlot(i,j,:) = [pt1 1];
        j = j + 1;
        commonPlot(i,j,:) = [pt2 1];
        j = j + 1;
        commonPlot(i,j,:) = [pt2 0];
    end
    
    plot(gyroPlot(i,:,1),gyroPlot(i,:,2))
    plot(veloPlot(i,:,1),veloPlot(i,:,2))
    plot(commonPlot(i,:,1),commonPlot(i,:,2))
end

%% EXTRACT THE WIND DATA FOR THE COMMON TIMES
for i = 1:size(baseNames_OtherGryo,1)
    j = 0;
    subplot(2,3,i);
    titleLine = append("Flight ",string(i));
    title(convertStringsToChars(titleLine));
    hold on;
    m = 0;
    for k = 1:size(lowMotion(i,:,:),2)
        t1 = lowMotion(i,k,1);
        t2 = lowMotion(i,k,2);
        h = 1;
        while Wind(i,h,1) < t1
            h = h + 1;
        end
        startplot = m;
        while Wind(i,h,1) < t2
            m = m + 1;
            lowMotionWind(i,m,:) = [Wind(i,h,1) Wind(i,h,2)];
            h = h + 1;
        end
        if startplot > 0 && startplot < m
            plot(lowMotionWind(i,startplot:m,2))
        end
    end
     
    %plot(lowMotionWind(i,:,1),lowMotionWind(i,:,2));
end
            
%% EXTRACT THE INDIVIDUAL FLIGHTS 

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("FLIGHT 1\n");

% FLIGHT 1
i = 1;
while lowMotionWind(1,i,1) < Flight_Timespans(1,1)
    i = i + 1;
end
j = 1;
while lowMotionWind(4,j,1) < Flight_Timespans(1,1)
    j = j + 1;
end
k = 0;
h = 0;
while lowMotionWind(1,i,1) < Flight_Timespans(1,2)
    k = k + 1;
    GondFlightWind(1,k,:) = [lowMotionWind(1,i,1) lowMotionWind(1,i,2)];
    i = i + 1;
end
while lowMotionWind(4,j,1) < Flight_Timespans(1,2)
    h = h + 1;
    SailFlightWind(1,k,:) = [lowMotionWind(4,i,1) lowMotionWind(4,i,2)];
    j = j + 1;
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("FLIGHT 2\n");

% FLIGHT 2
while lowMotionWind(1,i,1) < Flight_Timespans(2,1)
    i = i + 1;
end
while lowMotionWind(4,j,1) < Flight_Timespans(2,1)
    j = j + 1;
end
k = 0;
h = 0;
while lowMotionWind(1,i,1) < Flight_Timespans(2,2)
    k = k + 1;
    GondFlightWind(2,k,:) = [lowMotionWind(1,i,1) lowMotionWind(1,i,2)];
    i = i + 1;
end
while lowMotionWind(4,j,1) < Flight_Timespans(2,2)
    k = k + 1;
    SailFlightWind(2,k,:) = [lowMotionWind(4,i,1) lowMotionWind(4,i,2)];
    j = j + 1;
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("FLIGHT 3\n");

% FLIGHT 3
i = 1;
while lowMotionWind(2,i,1) < Flight_Timespans(3,1)
    i = i + 1;
end
j = 1;
while lowMotionWind(5,j,1) < Flight_Timespans(3,1)
    j = j + 1;
end
k = 0;
h = 0;
while lowMotionWind(2,i,1) < Flight_Timespans(3,2)
    k = k + 1;
    GondFlightWind(3,k,:) = [lowMotionWind(2,i,1) lowMotionWind(2,i,2)];
    i = i + 1;
end
while lowMotionWind(5,j,1) < Flight_Timespans(3,2)
    k = k + 1;
    SailFlightWind(3,k,:) = [lowMotionWind(5,i,1) lowMotionWind(5,i,2)];
    j = j + 1;
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("FLIGHT 4\n");

% FLIGHT 4
while lowMotionWind(2,i,1) < Flight_Timespans(4,1)
    i = i + 1;
end
while lowMotionWind(5,j,1) < Flight_Timespans(4,1)
    j = j + 1;
end
k = 0;
h = 0;
while lowMotionWind(2,i,1) < Flight_Timespans(4,2)
    k = k + 1;
    GondFlightWind(4,k,:) = [lowMotionWind(2,i,1) lowMotionWind(2,i,2)];
    i = i + 1;
end
while lowMotionWind(5,j,1) < Flight_Timespans(4,2)
    k = k + 1;
    SailFlightWind(4,k,:) = [lowMotionWind(5,i,1) lowMotionWind(5,i,2)];
    j = j + 1;
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("FLIGHT 5\n");

% FLIGHT 5
i = 1;
while lowMotionWind(3,i,1) < Flight_Timespans(5,1)
    i = i + 1;
end
j = 1;
while lowMotionWind(6,j,1) < Flight_Timespans(5,1)
    j = j + 1;
end
k = 0;
h = 0;
while lowMotionWind(3,i,1) < Flight_Timespans(5,2)
    k = k + 1;
    GondFlightWind(5,k,:) = [lowMotionWind(3,i,1) lowMotionWind(3,i,2)];
    i = i + 1;
end
while lowMotionWind(6,j,1) < Flight_Timespans(5,2)
    k = k + 1;
    SailFlightWind(5,k,:) = [lowMotionWind(6,i,1) lowMotionWind(6,i,2)];
    j = j + 1;
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("FLIGHT 6\n");

% FLIGHT 6
while lowMotionWind(3,i,1) < Flight_Timespans(6,1)
    i = i + 1;
end
while lowMotionWind(6,j,1) < Flight_Timespans(6,1)
    j = j + 1;
end
k = 0;
h = 0;
while lowMotionWind(3,i,1) < Flight_Timespans(6,2)
    k = k + 1;
    GondFlightWind(6,k,:) = [lowMotionWind(3,i,1) lowMotionWind(3,i,2)];
    i = i + 1;
end
while lowMotionWind(6,j,1) < Flight_Timespans(6,2)
    k = k + 1;
    SailFlightWind(6,k,:) = [lowMotionWind(6,i,1) lowMotionWind(6,i,2)];
    j = j + 1;
end

%% PLOT ALL THE THINGS

for i = 1:6
    subplot(2,3,i)
    titleLine = append("Gond Flight "