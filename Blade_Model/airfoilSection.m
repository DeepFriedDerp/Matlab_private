classdef airfoilSection
    %AIRFOILSECTION represections the airfoil section that will make up a
    %larger wing/blade
    
    
    properties
        quarterChord_Pt
        sref
        bref
        cref
        CD_current
        CL_current
        L_current
        D_current
        theta_offset_B % the theta offset angle from the vehicle body frame
    end
    
    methods
        function obj = airfoilSection(rBO_B,sectionSpan,sectionChord,initial_theta_offset)
            %airfoilSection Construct an instance of this class
            %   Detailed explanation goes here
            narginchk(3,4);
            
            obj.quarterChord_Pt = rBO_B;
            obj.sref = sectionSpan * sectionChord;
            obj.bref = sectionSpan;
            obj.cref = sectionChord;
            
            switch nargin
                case 3
                    obj.theta_offset_B = 0;
                case 4
                    obj.theta_offset_B = initial_theta_offset;
            end
                    
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

