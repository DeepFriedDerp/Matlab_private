function plot3Vect(inputFile)
    if exist(inputFile)
        inputFID = fopen(inputFile,'r');
    else
        error("file doesnt exist");
    end
    
    vector = [0,0,0];
    mag = 0;
    i = 0;
    line = fgetl(inputFID);
    while ischar(line)
        i = i + 1;
        commaIndex = strfind(line,",");
        
        X = extractBefore(line,commaIndex(1));
        Y = extractAfter(extractBefore(line,commaIndex(2)),commaIndex(1));
        Z = extractAfter(line,commaIndex(2));
        
        X = str2double(X);
        Y = str2double(Y);
        Z = str2double(Z);
        
        vector(i,:) = [X,Y,Z];
        mag(1,i) = norm(vector(i,:));
        
        line = fgetl(inputFID);
    end
    
    plot3(vector(:,1),vector(:,2),vector(:,3))
    figure
    plot(mag(1,:));
end
        