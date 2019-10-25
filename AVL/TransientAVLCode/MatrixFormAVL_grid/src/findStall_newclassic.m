function [success] = findStall_newclassic(design, plotFlag)
% [alfa, CL, errs] = findStall(design) returns the stall angle of 
% attack in degrees for the design structure design. 

success = 1;

 % run specific CL case
alfa = design.runs.const.a;
successRunloop = RunLoop(design, alfa, 1, 0);
if ~successRunloop
    disp("runloop problem");
    success = 0;
    return;
end
% iters = 1;
% alpha3 = alfa;
% itx = iters;

end