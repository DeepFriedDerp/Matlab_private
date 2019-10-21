function [xout] = IterSail(info, OutFlag, desrd, xNP, yT)
    
    % unpack the needed items
    mass1 = info.mass1;
    mass2 = info.mass2;
    mass3 = info.mass3;
    mass4 = info.mass4;
    mass5 = info.mass5;
    mass6 = info.mass6;
    mass7 = info.mass7;

    % find lower bound
    SMact_L = MathSail(info, OutFlag, xNP, yT);
    diff_L = desrd - SMact_L;
    if OutFlag == 1
        mass_L = mass5.mass;
        mass5.mass = mass5.mass + 5.5;
        info.mass5 = mass5;
        mass_U = mass5.mass;
    elseif OutFlag == 2
        mass_L = mass6.mass;
        mass6.mass = mass6.mass + 5.5;
        info.mass6 = mass6;
        mass_U = mass6.mass;
    end
    
    % find upper bound
    SMact_U = MathSail(info, OutFlag, xNP, yT);
    diff_U = desrd - SMact_U;
    diff_C = diff_U;
    exitFlag = 0;
    cntr = 0;
    
    while exitFlag ~= 1
        
        m1 = (diff_U - diff_L)/(mass_U - mass_L);   % slope 
        b1 = diff_U - m1*mass_U;                    % intercept
        mass_C = -b1/m1;                            % should be diff = 0
        if OutFlag == 1
            mass5.mass = mass_C;
            info.mass5 = mass5;
        elseif OutFlag == 2
            mass6.mass = mass_C;
            info.mass6 = mass6;
        end
        
        SMact_C = MathSail(info, OutFlag, xNP, yT);
        diff_C = desrd - SMact_C;
        if diff_C < 0 
            mass_L = mass_C;
            diff_L = diff_C;
        else
            mass_U = mass_C;
            diff_U = diff_C;
        end
        
        % diff_C
        mass_C;
        cntr = cntr + 1;
        if abs(diff_C) < 0.001
            exitFlag = 1;
        elseif cntr > 10
            warning('Iteration limit reached.'); 
            exitFlag = 1;
%         elseif mass_C < 0
%             warning('Ballast mass equal to zero.');
%             exitFlag = 1;
%             mass_C = 0;
%         elseif mass_C > 1000
%             mass_C = 1000;
%             warning('Ballast mass equal to upper limit.');
%             exitFlag = 1;
        end
    end
    if mass_C < 0
        warning('Ballast mass equal to zero.');
        mass_C = 0;
    elseif mass_C > 1000
        mass_C = 1000;
        warning('Ballast mass equal to upper limit.');
    end
    xout = mass_C;
    % keyboard
end