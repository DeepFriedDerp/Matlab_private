function [avgElev] = getXtraElevation(FileName)
    if exist(FileName)
        if ~exist('CALIB')
            mkdir CALIB;
        end
        cd CALIB;
        if ~exist('ALTIMETER')
            mkdir ALTIMETER;
        end
        cd ..;
    else
        error("FILENAME DOES NOT EXIST");
    end
    
    inputFID = fopen(FileName,'r');
    
    line = fgetl(inputFID);
    gpsElev = 0;
    i = 0;
    while ischar(line)
        i = i + 1;
        AltElev(i,1) = str2double(extractAfter(extractBefore(line,':'),','));
        line = fgetl(inputFID);
    end
    
    avgElev = mean(AltElev);
end
