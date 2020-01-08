classdef wingBlade
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        startPoint_B        % quarterchord start point (top)
        endPoint_B          % quarterchord end point (bottom)
        numberOfSections    % 
        chord
        span
        theta_offset_B      % for the rudder
    end
    
    methods
        function obj = wingBlade(startPt,endPt,sectionNum,chord,theta_offset)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            narginchk(4,5);
            
            obj.startPoint_B = startPt;
            obj.endPoint_B = endPt;
            obj.numberOfSections = sectionNum;
            obj.chord = chord;
            
            switch nargin
                case 4
                    obj.theta_offset_B = 0;
                case 5
                    obj.theta_offset_B = theta_offset;
            end
            
            
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

