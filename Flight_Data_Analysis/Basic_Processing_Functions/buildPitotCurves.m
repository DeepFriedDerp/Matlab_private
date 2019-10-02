function buildPitotCurves(calDataFolder,baseFilename,velocityCalPoints)
%scan the file structure
    cd(calDataFolder);
    fileStructure1 = convertStringsToChars(strtrim(string(ls)));
    j = 0;
    fileStructureCell{1,1} = "0";
    for i = 1:size(fileStructure1,1)
        if isfolder(fileStructure1{i,:}) && (length(fileStructure1{i,:}) > 2)
            j = j + 1;
            fileStructureCell{j,1} = fileStructure1{i,:};
            cd(fileStructure1{i,:});
            fileStructure2 = convertStringsToChars(strtrim(string(ls)));
            k = 1;
            for h = 1:size(fileStructure2,1)
                if (isfile(fileStructure2{h,:})) && (contains(fileStructure2{h,:},baseFilename))
                    k = k + 1;
                    fileStructureCell{j,k} = fileStructure2{h,:};
                end
            end
            cd ..;
        end
    end
    
    cd ..;
    
% create the output filesystem
    if ~exist('CALDATA')
        mkdir CALDATA;
    end
    cd CALDATA;
    if ~exist('PITOT')
        mkdir PITOT;
    end
    cd PITOT;
    
    for i = 1:size(fileStructureCell,1)
        workingFolder = fileStructureCell{i,1};
        if ~exist(workingFolder)
            mkdir(workingFolder);
        end
    end
    cd ..;
    cd ..;
    
    
% get datapoints
    cd(calDataFolder);
    clear h i j k;
    dataSetAverages = zeros(size(fileStructureCell,1),size(velocityCalPoints,2));
    for h = 1:size(fileStructureCell,1)
        workingFolder(1,:) = fileStructureCell{h,1};
        cd(workingFolder);
        i = 0;
        fileName = "0";
        for j = 1:size(velocityCalPoints,2)
            if i < 10
                fileName = append(baseFilename,"0",string(i));
            else
                fileName = append(baseFilename,string(i));
            end
            for k = 2:size(fileStructureCell,2)
                if contains(fileStructureCell{h,k},fileName)
                    if contains(fileStructureCell{h,k},".txt")
                        fileName2Open = append(fileName,".txt");
                        inputFID = fopen(fileName2Open,'r');
                    else
                        fileName2Open = append(fileName,".TXT");
                        inputFID = fopen(fileName2Open,'r');
                        
                    end
                    if inputFID > 0
                        data = 0;
                        count = 0;
                        line = '11';
                        while ischar(line)
                            line = fgetl(inputFID);
                            if ischar(line)
                                count = count + 1;
                                data(count,1) = str2double(line);
                            end
                        end
                        fclose(inputFID);
                        average = mean(data);
                        dataSetAverages(h,j) = average;
                        data = 0;
                    end
                end
            end
            i = i + 2;
        end
        cd ..;
    end
    cd ..;
                    
%now write the output into the output file structure
    cd CALDATA;
    cd PITOT;
    for h = 1:size(fileStructureCell,1)
        workingFolder = fileStructureCell{h,1};
        cd(workingFolder);
        workingDataSet = 0;
        outputFID_text = fopen('calibrationPoints.txt','w');
        for i = 1:size(velocityCalPoints,2)
            velocityPt = velocityCalPoints(1,i);
            binPt = dataSetAverages(h,i);
            workingDataSet(i,1) = binPt;
            workingDataSet(i,2) = velocityPt;
            fprintf(outputFID_text,"%.3f,%f\n",binPt,velocityPt);
        end
        %build curve fit
        %fitType = append('poly',string((size(velocityCalPoints,2)-2)));
        pitotCurveFit = fit(workingDataSet(:,1),workingDataSet(:,2),'poly4');
        save('curveFitFunc.mat','pitotCurveFit');
        cd ..;
    end
    cd ..;
    cd ..;    
end