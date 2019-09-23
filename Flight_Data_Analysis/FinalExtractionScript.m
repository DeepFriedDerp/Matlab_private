%% GENERATE THE FILE STRUCTURE
clear;

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("script staring now\n");

parentFolder = 'TestFlight_Aug30_19';
folderLevel1 = ['Gondola1' 'Gondola2' 'Gondola3' 'Sail1' 'Sail2' 'Sail3' 'XTRA_GND_STN'];
OtherFile = ['AODATA00' 'AODATA01' 'AODATA02'];
gpsFile = ['GPSLOG00' 'GPSLOG01' 'GPSLOG02'];

gondola_pitotCal = './CALDATA/PITOT/G_UNIT/curveFitFunc.mat';
sail_pitotCal = './CALDATA/PITOT/S_UNIT/curveFitFunc.mat';

xtraGndBaseName_Other = append(parentFolder,folderLevel1(7),OtherFile(3));
xtraGndBaseName_GPS = append(parentFolder,folderLevel1(7),gpsFile(3));

baseNames_Other(1,:) = append("./",parentFolder,"/",folderLevel1(1),"/",OtherFile(1));
baseNames_Other(2,:) = append("./",parentFolder,"/",folderLevel1(2),"/",OtherFile(1));
baseNames_Other(3,:) = append("./",parentFolder,"/",folderLevel1(3),"/",OtherFile(2));
baseNames_Other(4,:) = append("./",parentFolder,"/",folderLevel1(4),"/",OtherFile(1));
baseNames_Other(5,:) = append("./",parentFolder,"/",folderLevel1(5),"/",OtherFile(1));
baseNames_Other(6,:) = append("./",parentFolder,"/",folderLevel1(6),"/",OtherFile(1));

baseNames_GPS(1,:) = append("./",parentFolder,"/",folderLevel1(1),"/",gpsFile(1));
baseNames_GPS(2,:) = append("./",parentFolder,"/",folderLevel1(2),"/",gpsFile(1));
baseNames_GPS(3,:) = append("./",parentFolder,"/",folderLevel1(3),"/",gpsFile(2));
baseNames_GPS(4,:) = append("./",parentFolder,"/",folderLevel1(4),"/",gpsFile(1));
baseNames_GPS(5,:) = append("./",parentFolder,"/",folderLevel1(5),"/",gpsFile(1));
baseNames_GPS(6,:) = append("./",parentFolder,"/",folderLevel1(6),"/",gpsFile(1));

extendedBaseNames_Other = [baseNames_Other ; xtraGndBaseName_Other];
extendedBaseNames_GPS = [baseNames_GPS ; xtraGndBaseName_GPS];

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("fileNames have been generated!\n");

%% GENERATE COMMON TIME FOR OTHERDATA
for i = 1:size(extendedBaseNames_Other,1)
    filename = append(extendedBaseNames_Other(i,:),".TXT");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s convertTime starting now...\n",filename);
    convertTime(filename);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("commonTime for otherdata complete\n");

%% CHANGE FOLDERPATH FOR OTHERDATA GENERATED FILES
extract = extractAfter(baseNames_Other,"./");
extract_ext = extractAfter(extendedBaseNames_Other,"./");
extendedBaseNames_Other = append("./GENERATED_DATA/",extract_ext,"_TimeConvert");
baseNames_Other = append("./GENERATED_DATA/",extract,"_TimeConvert");

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("folderpath update for otherdata complete\n");
    
%% GENERATE COMMON TIME FOR GPSDATA
for i = 1:size(extendedBaseNames_GPS,1)
    filename = append(extendedBaseNames_GPS(i,:),".TXT");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s convertTime starting now...\n",filename);
    convertTime(filename);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("commonTime for gpsdata complete\n");

%% CHANGE FOLDERPATH FOR GPSDATA GENERATED FILES
extract = extractAfter(baseNames_GPS,"./");
extract_ext = extractAfter(extendedBaseNames_GPS,"./");
extendedBaseNames_GPS = append("./GENERATED_DATA/",extract_ext,"_TimeConvert");
baseNames_GPS = append("./GENERATED_DATA/",extract,"_TimeConvert");

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("folderpath update for gpsdata complete\n");
    
%% SORT LINES OF OTHERDATA
for i = 1:size(extendedBaseNames_Other)
    filename = append(extendedBaseNames_Other(i,:),".txt");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s sortLines starting now...\n",filename);
    sortLines(filename);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("sortlines for otherdata complete\n");

%% UPDATE FOLDERPATH FOR OTHERDATA (SORTED)
baseNames_Other = append(baseNames_Other,"_Sorted");
extendedBaseNames_Other = append(extendedBaseNames_Other,"_Sorted");

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("folderpath update for otherdata complete\n");

%% SORT LINES OF GPSDATA
for i = 1:size(extendedBaseNames_GPS,1)
    filename = append(extendedBaseNames_GPS(i,:),".txt");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s sortLines starting now...\n",filename);
    sortLines(filename);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("sortlines for gpsdata complete\n");

%% UPDATE FOLDERPATH FOR GPSDATA (SORTED)
baseNames_GPS = append(baseNames_GPS,"_Sorted");
extendedBaseNames_GPS = append(extendedBaseNames_GPS,"_Sorted");

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("folderpath update for gpsdata complete\n");

%% RUN FILTER ON RAW DATA
for i = 1:size(extendedBaseNames_Other)
    filename = append(extendedBaseNames_Other(i,:),".txt");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s filterRawData starting now...\n",filename);
    filterRawData(filename,10);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("filter for otherdata complete\n");

%% UPDATE FOLDERPATH FOR OTHERDATA (FILTERED RAW)
baseNames_Other = append(baseNames_Other,"_FilteredRaw");
extendedBaseNames_Other = append(extendedBaseNames_Other,"_FilteredRaw");

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("folderpath update for otherdata complete\n");

%% EXTRACT DELTA ELEVATION DATA
xtraGndBaseName_Other = extendedBaseNames_Other(7,:);
xtraGndBaseName_GPS = extendedBaseNames_GPS(7,:);

gndStnFile = append(xtraGndBaseName_Other,".txt");
for i = 1 : size(baseNames_Other,1)
    filename = append(baseNames_Other(i,:),".txt");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s getAltDeltaElevation starting now...\n",filename);
    getAltDeltaElevation(filename,gndStnFile);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("delta_elevation for otherdata complete\n");

%% EXTRACT RAW DATA 3-VECTORS (ACC,GYRO,MAG,ETC)
for i = 1 : size(baseNames_Other,1)
    filename = append(baseNames_Other(i,:),".txt");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s Other3VectorsExtract starting now...\n",filename);
    other3VectorsExtract(filename);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("other 3-vector extraction for otherdata complete\n");

%% EXTRACT PITOT DATA 
for i = 1 : size(baseNames_Other,1)
    if i >=4
        calFile = sail_pitotCal;
    else
        calFile = gondola_pitotCal;
    end
 
    filename = append(baseNames_Other(i,:),".txt");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s extractPitot starting now...\n",filename);
    otherWindSpeedExtract(filename,calFile);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("pitotData extraction for otherdata complete\n");

%% EXTRACT GPS VELOCITY,HEADING 2-VECTOR
for i = 1 : size(baseNames_GPS,1)
    filename = append(baseNames_GPS(i,:),".txt");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s gps2VectorVelocityHeading starting now...\n",filename);
    gps2VectorVelocityHeading(filename);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("2-vector for gpsdata complete\n");

%% EXTRACT HIGH-ACCURACY GPS/OTHER POSITION 3-VECTOR
for i = 1 : size(baseNames_GPS,1)
    filename_GPS = append(baseNames_GPS(i,:),".txt");
    filename_Other = append(baseNames_Other(i,:),"_relativeAltElev.txt");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s gps3Vector starting now...\n",filename_GPS);
    gps3VectorPos(filename_GPS,filename_Other);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("position 3-vector for gpsdata/otherdata complete\n");

%% GENERATE ORIENTATION DATA USING THE MADGWICK FILTER
for i = 1 : size(baseNames_Other,1)
    filename = append(baseNames_Other(i,:),".txt");
    fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
    fprintf("%s MadgwickBcO starting now...\n",filename);
    MadgwickBcO(filename);
end

fprintf("%s - ",string(datetime(now,'ConvertFrom','datenum')));
fprintf("madgwick orientation for otherdata complete\n");



