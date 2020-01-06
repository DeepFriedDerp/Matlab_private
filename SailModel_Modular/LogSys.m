classdef LogSys
    properties
        logFile_path % the absolute/relative path to the logfile (includes logfile name)
        log_function % a string with the name of the current function, for easy tracking
        log_type     % the priority or type of status for each log entry
    end
    methods
        function obj = LogSys(arg1,arg2,arg3)
            narginchk(0,3);
            
            switch nargin
                case 0
                    obj.logFile_path = 'logFile_default.txt'; % default relative path
                    obj.log_function = '[]';                  % empty function name
                    obj.log_type = 'U';                       % U for 'Unspecified' logtype
                case 1
                    if size(arg1,2) < 2
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
        end
    end
end

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
            error("exiting program...\n");
        else
            property_found = property_found_new;
        end
    end        
end


function [propFound_new] = argFinder(arg,propFound_old)
    if size(arg,2) < 2 && ~(propFound_old(3))
        propFound_new = propFound_old | [0 0 1];
        return;
    elseif size(arg,2) < 2 && (propFound_old(3))
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
                

                    