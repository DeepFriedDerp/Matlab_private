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
     
     GyroLineNum = 0;
     WindLineNum = 0;
     OcBLineNum = 0;
     gpsLineNum = 0;

     
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
                 GyroLineNum = GyroLineNum + 1;
                 Gyro(i,GyroLineNum,:) = [commonTime gyroX gyroY gyroZ];
             end
         end
         gyroLine = fgetl(inputFID_Gryo);
         
         
         % get the wind Info
         if ~isnumeric(windLine)
             if contains(windLine,",")
                 commonTime = str2double(extractBefore(windLine,","));
                 windX = str2double(extractAfter(windLine,","));
                 if ~(isnan(commonTime) && isnan(windX))
                     WindLineNum = WindLineNum + 1;
                     Wind(i,WindLineNum,:) = [commonTime windX];
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
                     OcBLineNum = OcBLineNum + 1;
                     OcBTime(i,OcBLineNum,1) = commonTime;
                     OcB(i,OcBLineNum,:,:) = [
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
                 gpsLineNum = gpsLineNum + 1;
                 gpsData(i,gpsLineNum,:) = [commonTime velocity heading];
             end
         end
         gpsLine = fgetl(inputFID_gps);
     end
     fclose(inputFID_Gryo);
     fclose(inputFID_Wind);
     fclose(inputFID_OcB);
     fclose(inputFID_gps);
 end
         
%% PROCESS THE DATA?