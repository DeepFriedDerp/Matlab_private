function [alfa, CL, errs, iters, xNP, de,success] = findStall_newclassic(design, plotFlag)
% [alfa, CL, errs] = findStall(design) returns the stall angle of 
% attack in degrees for the design structure design. 

success = 1;

% select analysis type
if isfield(design.runs.const, 'stall') == 1
    
    % disp stuffs
    %%disp('Finding stall alpha ... ');

    % where is avl
    alpha1 = 2;
    alpha2 = 14;
    tol = 5e-3;
    exitFlag = 0;

    % alpha 1
    [CL_low, errs_low, xNP,successRunloop] = RunLoop(design, alpha1, 1, 0);
    if ~successRunloop
        success = 0;
        return;
    end
    
    iters = 1;
    alfa1 = alpha1;

    % alpha 2
    [CL_high, errs_high,successRunloop] = RunLoop(design, alpha2, 2, 0);
    if ~successRunloop
        success = 0;
        return;
    end

    % store values per iteration
    iters(1, 1:3) = [alpha1, CL_low, errs_low];
    iters(2, 1:3) = [alpha2, CL_high, errs_high];
    itx = 3;

    % loops on loops
    while exitFlag ~= 1

        % interpolate to find the stall alpha
        % errs_low is positive
        % errs_high is negative
        if errs_low > 0 && errs_high < 0
            alpha3 = interp1(iters(:, 3), iters(:, 1), 0, 'linear');

        else
            alpha3 = interp1(iters(:, 3), iters(:, 1), 0, 'linear', 'extrap');

        end

        % run
        
        [CL_new, errs_new, xNP, de, successRunloop] = RunLoop(design, alpha3, itx, 0);
        if ~successRunloop
            success = 0;
            return;
        end
        
        iters(itx, 1:3) = [alpha3, CL_new, errs_new];
        itx = itx + 1;

        % decide if go again
        if abs(errs_new) < tol
            exitFlag = 1;
            alfa = alpha3;
            CL = CL_new;
            errs = errs_new;
        end

        % choose new points
        % if errs_new is positive
        % if 1 < 2
        if abs(errs_new) < abs(errs_low)
            errs_low = errs_new;

        elseif abs(errs_new) < abs(errs_high)
            errs_high = errs_new;

        end

    end
    
    
elseif isfield(design.runs.const, 'a') == 1
    
    % disp stuffs
    %disp('Finding constant alpha ... ');
    
    % run specific alpha case
    alfa = design.runs.const.a;
    [CL, errs, xNP, de, successRunloop] = RunLoop(design, alfa, 1, 0);
    if ~successRunloop
        success = 0;
        return;
    end
    
    iters = 1;
    alpha3 = alfa;
    itx = iters;
    
elseif isfield(design.runs.const, 'c') == 1
    
    % disp stuffs
    %disp('Finding constant CL ... ');
    
    % run specific CL case
    alfa = NaN;
    [CL, errs, xNP, de, alfa, successRunloop] = RunLoop(design, alfa, 1, 0);
    if ~successRunloop
        success = 0;
        return;
    end
    
    iters = 1;
    alpha3 = alfa;
    itx = iters;
    
elseif isfield(design.runs.const, 'de') == 1
        
    % disp stuffs
    %disp('Finding constant de ... ');
    
    % run specific CL case
    alfa = NaN;
    [CL, errs, xNP, de, alfa, successRunloop] = RunLoop(design, alfa, 1, 0);
    if ~successRunloop
        success = 0;
        return;
    end
    
    iters = 1;
    alpha3 = alfa;
    itx = iters;
    
elseif isfield(design.runs.const, 'ang') == 1
    % disp stuffs
    %disp('Running angles ... ');
    
     % run specific CL case
    alfa = design.runs.const.a;
    [CL, errs, xNP, de, alfa, successRunloop] = RunLoop(design, alfa, 1, 0);
    if ~successRunloop
        success = 0;
        return;
    end
    
    iters = 1;
    alpha3 = alfa;
    itx = iters;
    
else
    success = 0; % don't crap your pants 
    return;
    %error('Missing analysis selection.');
end
    
    
% plot best case
if plotFlag == 1
    RunLoop(design, alpha3, itx, 1);
end

end