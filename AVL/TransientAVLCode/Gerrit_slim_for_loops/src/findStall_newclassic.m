function [successState] = findStall_newclassic(design, plotFlag)
% [alfa, CL, errs] = findStall(design) returns the stall angle of 
% attack in degrees for the design structure design. 
    
% run specific CL case
successState = RunLoop(design, design.runs.const.a, 1, plotFlag);

end