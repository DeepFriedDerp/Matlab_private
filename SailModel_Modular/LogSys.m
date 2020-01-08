classdef LogSys
    properties
        logFile_path        % the absolute/relative path to the logfile (includes logfile name)
        log_function        % a string with the name of the current function, for easy tracking
        log_type            % the type of status for each log entry
        log_priority        % the priority filter for log object, logs will a specified priority of this or higher will be written to the log. Default erthang.
        log_headerPath      % path to a custom header file that will be placed at the top of each log file on initial log placement, default empty, default header in defualtHeader Function
        initial_logbit      % used to track writing of the header for the first log entry of the file.
        initial_overwrite   % used to overwrite an existing logfile each time a LogSys object is instantiated and the first logStat is called to the path file, default append
        status_buffer       % used to build a status string
    end
    methods
        % constructor
        function obj = LogSys(arg1,arg2,arg3)
            narginchk(0,3);
            
            switch nargin
                case 0
                    obj.logFile_path = 'logFile_default.txt'; % default relative path
                    obj.log_function = '[]';                  % empty function name
                    obj.log_type = 'U';                       % U for 'Unspecified' logtype
                case 1
                    if strlength(arg1) < 2
                        obj.log_type = arg1;
                    elseif contains(arg1,'.')
                        obj.logFile_path = arg1;
                    else
                        obj.log_function = arg1;
                    end
                case 2
                    argList = [string(arg1);string(arg2)];
                    assignedList = argAssigner(argList);
                    for i = 1:size(assignedList,2)
                        switch assignedList(i)
                            case 1
                                obj.logFile_path = argList(i,:);
                            case 2
                                obj.log_function = argList(i,:);
                            case 3
                                obj.log_type = argList(i,:);
                        end
                    end
                case 3
                    argList = [string(arg1);string(arg2);string(arg3)];
                    assignedList = argAssigner(argList);
                    for i = 1:size(assignedList,2)
                        switch assignedList(i)
                            case 1
                                obj.logFile_path = argList(i,:);
                            case 2
                                obj.log_function = argList(i,:);
                            case 3
                                obj.log_type = argList(i,:);
                        end
                    end
            end
            
            if isempty(obj.logFile_path)
                obj.logFile_path = 'logFile_default.txt'; % default relative path
            end
            if isempty(obj.log_type)
                obj.log_type = 'U';
            end
            
            obj.log_priority = 4;
            obj.log_headerPath = [];
            obj.initial_logbit = 0;
            obj.initial_overwrite = 0;
        end
        
        
        % Log a status to the logfile
        function [status] = logStatus(obj,statPriority,functionName,statusString)
            narginchk(1,4);
            nargoutchk(0,1);
            
            switch nargin
                case 1
                    statePriority = 4;
                    functionName = obj.log_function;
                    statusString = obj.status_buffer;
                case 2
                    functionName = obj.log_function;
                    statusString = obj.status_buffer;
                case 3
                    statusString = obj.status_buffer;
            end
            
            
        end
        
        %change the logFile path of the object
        function changeFile(obj,newPath)
            try
                logFileBuilder(newPath)
                obj.logFile_path = newPath;
                status = append("logFile path changed to : ", string(newPath));
                logStatus(obj,3,'LogSys.changeFile',status);
            catch
                disp("ChangeFile method fail : failed to change log location.")
                status = append("Failed to change log file path to : ", string(newPath));
                logStatus(obj,1,'LogSys.changeFile',status);
            end
        end
        
        %change the name of the function from whence the log comes from
        function changeFunction(obj,newFunction)
            if (ischar(newFunction) || isstring(newFunction)
                try
                    obj.log_function = newFunction;
                    status = append("logFunction changed to : ", string(newFunction));
                    logStatus(obj,3,'LogSys.changeFunction',status);
                catch
                    disp("changeFunction method fail : failed to change function name.")
                    status = append("Failed to change log's originating function name to : ",string(newFunction));
                    logStatus(obj,1,LogSys.changeFunction',status);
                end
            else
                disp("changeFunction method fail : argument is not a char array or string.")
                status = append(string(newFunction)," is not a char array or string, failed to change functionName");
                logStatus(obj,1,LogSys.changeFunction',status);
            end
        end
        
        %change the log status type
        function changeType(obj,newType)
            if (ischar(newType) || isstring(newType)) && (strlength(newType) < 2)
                try 
                    obj.log_type = newType;
                    status = append("logType changed to : ", string(newType));
                    logStatus(obj,3,'LogSys.changeType',status);
                catch
                    disp("ChangeType method fail : failed to change log type")
                    status = append("Failed to change log type to : ", string(newType));
                    logStatus(obj,1,'LogSys.changeType',status);
                end
            else
                disp("ChangeType method fail : newType argument is not a valid type")
                status = append(string(newType)," is not a valid argument for function, failed to change type");
                logStatus(obj,1,'LogSys.changeType',status);
            end
        end
        
        %change the header path (if using a non-default header)
        function changeHeaderPath(obj,newPath)
            if (contains(newPath,'.txt') || contains(newPath,'.TXT')) && exist(newPath,'file')
                obj.log_headerPath = newPath;
                status = append("headerPath changed to : ", string(newPath));
                logStatus(obj,3,'LogSys.changeHeaderPath',status);
            else
                if exist(newPath,'file')
                    status = append(string(newPath)," is not a .txt or .TXT file extension, failed to change headerPath");
                else
                    status = append(string(newPath)," does not exist, failed to change headerPath");
                end
                disp(append("changeHeaderPath method fail : ",status))
                logStatus(obj,1,'LogSys.changHeaderPath',status);
            end
        end
        
        %set initial overwrite option to true (to overwrite an existing
        %logfile when logStat is called next)
        function setOverwriteTrue(obj)
            obj.initial_overwrite = 1;
        end
        
        %set initial overwrite option to false (to cancel an overwrite to
        %an existing logfile when logStat is called next)
        function setOverwriteFalse(obj)
            obj.initial_overwrite = 0;
        end
        
        %set initial bit to true (to insert the contents of the header file
        %into the log file when the next logStat is called)
        function setHeaderTrue(obj)
            obj.initial_logbit = 1;
        end
        
        %set initial bit to false 
        function setHeaderFalse(obj)
            obj.initial_logbit = 0;
        end
        
        
        
        
    end
end

%% supporting functions
function [assignedList] = argAssigner(argList)
    property_found = [0 0 0];
    assignedList = zeros(1,size(argList,1));

    for argNum = 1 : size(argList,1)
        [property_found_new] = argFinder(argList(argNum,:),property_found);
        propCompare = xor(property_found_new, property_found);

        for i = 1:3
            propAssignInd = propCompare(i);
            if propAssignInd
                assignedList(argNum) = i;
                break
            end
        end
        if assignedList(argNum) < 1
            sprintf("%s\n",argList(argNum,:))
            error("exiting program");
        else
            property_found = property_found_new;
        end
    end        
end


function [propFound_new] = argFinder(arg,propFound_old)
    if (strlength(arg) < 2) && ~(propFound_old(3))
        propFound_new = propFound_old | [0 0 1];
        return;
    elseif (strlength(arg) < 2) && (propFound_old(3))
        sprintf("LogSys Init Fail : %s was identified as log_type, but log_type has already been identified as ",string(arg))
        propFound_new = propFound_old;
        return;
    end

    if contains(arg,'.') && ~(propFound_old(1))
        propFound_new = propFound_old | [1 0 0];
        return;
    elseif contains(arg,'.') && (propFound_old(1))
        sprintf("LogSys Init Fail : %s was identified as logFile_path, but logFile_path has already been identified as ",string(arg))
        propFound_new = propFound_old;
        return;
    end

    if ~(propFound_old(2))
        propFound_new = propFound_old | [0 1 0];
        return;
    elseif (propFound_old(2))
        sprintf("LogSys Init Fail : %s was identified as log_function, but log_function has already been identified as ",string(arg))
        propFound_new = propFound_old;
        return;
    end

    disp("LogSys Init Fail : Unknown error in argFinder method, reached end of function without returning\n")
    mode = 0;
    propFound_new = propFound_old;
    return;
end
                
function logFileBuilder(path)
    if ~contains(path,'/')
        return;
    end
    
    homePath = pwd;
    pathArray = split(path,'/');
    numFolders = size(pathArray,1);
    
    for i = 1 : (numFolders-1)
        tries = 0;
        status = 0;
        while status < 1 && j < 100
            status = mkdir(pathArray(i,1));
            tries = tries + 1;
        end
        if tries >= 100
            error("LogSys Init Fail : Could not create log file path")
        end
    end    
end
                    
