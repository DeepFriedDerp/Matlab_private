function MadgwickBcO(inputFile)
    %check for inputs
    if ~exist(inputFile)
        error("inputfile does not exist");
    end
    %extract inputfile base name
    if contains(inputFile,".TXT")
        filename = extractBefore(inputFile,'.TXT');
    elseif contains(inputFile,'.txt')
        filename = extractBefore(inputFile,'.txt');
    end
    %construct output filename
    outputFile = append(filename,"_MadgwickMatrix.txt");

    %add some needed paths
    addpath quaternion_library;

    %instantiate the Madgwick filter object
    myIMU = MadgwickAHRS_V2('Beta',0.035);

    %open the inputfile and set up some basic variables
    inputFID = fopen(inputFile,'r');
    eul = [0,0,0];
    line = fgetl(inputFID);
    minStateFound = 0;
    minInd = 0;
    minIndTime = 0;
    i = 0;
    %search through the inputfile's euler angle sets and look for places where
    %the roll and pitch angles are super shallow, and log the place in the file
    %where that occurs
    while ischar(line)
        i = i+1;
        commaIndex = strfind(line,",");
        time = str2double(extractBefore(line,commaIndex(1)));
        eulX = str2double(extractAfter(extractBefore(line,commaIndex(11)),commaIndex(10)));
        eulY = str2double(extractAfter(extractBefore(line,commaIndex(12)),commaIndex(11)));
        eulZ = str2double(extractAfter(extractBefore(line,commaIndex(13)),commaIndex(12)));
        if eulY < 0.1 && eulZ < 0.1
            if minStateFound < 1
                minIndTime = time;
            end
            minStateFound = 2;
            minInd = [minInd,i];
        end

        eul(i,:) = [eulX,eulY,eulZ];
        line = fgetl(inputFID);
    end
    fclose(inputFID); % reset the inputFile scan point

    %if you can't find the condition specified in the beggining of the test
    %data, then return an error, otherwise, look at the first instance and grab
    %the heading data, then convert it to radians
    if minStateFound > 1 && minInd(1) < (size(eul,1)/50)
        thetaX = eul(minInd(2),1);
        thetaX = thetaX * ((2*pi())/360);
    else
        error("min orientation not found");
    end
    %use that heading data to setup up the Madgwick Object's initial
    %orientation quaternion
    quatInit = [cos(thetaX/2) 0 0 sin(-thetaX/2)];
    quatInit = quatInit/norm(quatInit);
    myIMU.Quaternion = quatInit;

    %re-open the inputfile and now open the outputfile, and then cycle through
    %the inputfile lines until you get to the index where the initial
    %orientation quaternion is set.
    inputFID = fopen(inputFile,'r');
    outputFID = fopen(outputFile,'w');
    for i = i:minInd(2)
        fgetl(inputFID);
    end
    %setup some initial variables
    % rotatedMag = [0 0 0];     %
    % rotatedGrav = [0 0 0];    %
    % rotatedAcc = [0 0 0];     % artifacts of the development process
    % rotatedGyro = [0 0 0];    %
    % elevation = 0;            %
    i = 0;
    timeOld = minIndTime;
    line = fgetl(inputFID);

    %scan through the input:
    %   ~reset the orientation quaternion as you come
    %       to the ultra low roll/pitch points along the dataset. 
    %   ~Grab numerical values for time, acceleration, gyroscope, and 
    %       magnetometer data. 
    %   ~Calculate deltaT for each line
    %   ~Feed the raw data and deltaT into the Madgwick filter and let it do
    %       its "magwick", which updates the quaternion value for the object
    %   ~Convert the quaternion to a rotation matrix and attach it to the end
    %       of the data line being looked at, then print the whole thing to the
    %       output file.
    while ischar(line)
        i = i+1;
        %if i = any of the indices that match the quaternion reset
        %conditions, realign the quaterion
        fminFinder = find(minInd==i);
        if fminFinder > 0
            thetaX = eul(minInd(fminFinder),1);
            thetaX = thetaX * ((2*pi())/360);
            quatInit = [cos(thetaX/2) 0 0 sin(-thetaX/2)];
            quatInit = quatInit/norm(quatInit);
            myIMU.Quaternion = quatInit;
        end

        %generate an index vector of where the commas are in the line, and
        %extract the relevant data between the commas, then convert them into
        %numbers. 
        commaIndex = strfind(line,",");
        timeNew = str2double(extractBefore(line,commaIndex(1)));

        accX = str2double(extractAfter(extractBefore(line,commaIndex(2)),":"));
        accY = str2double(extractAfter(extractBefore(line,commaIndex(3)),commaIndex(2)));
        accZ = str2double(extractAfter(extractBefore(line,commaIndex(4)),commaIndex(3)));

        gyroX = str2double(extractAfter(extractBefore(line,commaIndex(5)),commaIndex(4)));
        gyroY = str2double(extractAfter(extractBefore(line,commaIndex(6)),commaIndex(5)));
        gyroZ = str2double(extractAfter(extractBefore(line,commaIndex(7)),commaIndex(6)));

        magX = str2double(extractAfter(extractBefore(line,commaIndex(8)),commaIndex(7)));
        magY = str2double(extractAfter(extractBefore(line,commaIndex(9)),commaIndex(8)));
        magZ = str2double(extractAfter(extractBefore(line,commaIndex(10)),commaIndex(9)));
        
        %assemble the individual points into vectors
        acc_B = [accX;accY;accZ];
        gyro_B = [gyroX;gyroY;gyroZ];
        mag_B = [magX;magY;magZ];

        %determine deltaT (dt)
        dt = (timeNew - timeOld);
        timeOld = timeNew;

        %update the Madgwick filter object with this line's raw sensor data
        myIMU = Update(myIMU, transpose(gyro_B), transpose(acc_B), transpose(mag_B), dt);
        %convert the updated quaternion to a numerical rotation sequence
        BcO = quatern2rotMat(myIMU.Quaternion);


        % stuff in green no longer needed, but I don't wanna get rid of it
    %     OcB = transpose(BcO);
    %     rotatedAcc(i,:) = transpose(OcB*acc_B);
    %     rotatedGyro(i,:) = transpose(OcB*gyro_B);
    %     rotatedMag(i,:) = transpose(OcB*mag_B);
    %     rotatedGrav(i,:) = transpose(OcB*grav_B);
    %     
    %     rotVectHolder = [(rotatedAcc(i,:));(rotatedGyro(i,:));(rotatedMag(i,:));(rotatedGrav(i,:))];


        %print the original line of data
        fprintf("%s",line);
        %tack on the 9 elements of the BcO matrix after the dataSet
        for j = 1:3
            for k = 1:3
                if k == 3 && j == 3
                    fprintf(outputFID,"%f\n",BcO(j,k));
                elseif k == 3
                    fprintf(outputFID,"%f:",BcO(j,k));
                else
                    fprintf(outputFID,"%f,",BcO(j,k));
                end
            end
        end
        %grab a new line and iterate
        line = fgetl(inputFID);
    end

    %Again, don't want to get rid of it, because it's neat.
    %plot(elev(98784:173619,1));
    % subplot(2,2,1);
    % scatter3(rotatedMag(47261:55907,1),rotatedMag(47261:55907,2),rotatedMag(47261:55907,3),'.')
    % legend('Magnetometer');
    % xlabel('X');
    % ylabel('Y');
    % zlabel('Z');
    % subplot(2,2,2);
    % scatter3(rotatedGrav(47261:55907,1),rotatedGrav(47261:55907,2),rotatedGrav(47261:55907,3),'.');
    % legend('Gravity Vect');
    % xlabel('X');
    % ylabel('Y');
    % zlabel('Z');
    % subplot(2,2,3);
    % scatter3(rotatedAcc(47261:55907,1)-rotatedGrav(47261:55907,1),rotatedAcc(47261:55907,2)-rotatedGrav(47261:55907,1),rotatedAcc(47261:55907,3)-rotatedGrav(47261:55907,1)-9.808,'.');
    % legend('Acceleration');
    % xlabel('X');
    % ylabel('Y');
    % zlabel('Z');
    % subplot(2,2,4);
    % scatter3(rotatedGyro(47261:55907,1),rotatedGyro(47261:55907,2),rotatedGyro(47261:55907,3),'.');
    % legend('Gyroscope');
    % xlabel('X');
    % ylabel('Y');
    % zlabel('Z');

    %scatter3(rotatedAcc(:,1),rotatedAcc(:,2),rotatedAcc(:,3),'.')
    %scatter3(rotatedGyro(:,1),rotatedGyro(:,2),rotatedGyro(:,3),'.')

    %close the files before exiting the function
    fclose(inputFID);
    fclose(outputFID);
end
    