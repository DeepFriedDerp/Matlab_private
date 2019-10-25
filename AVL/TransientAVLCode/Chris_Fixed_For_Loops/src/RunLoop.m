function [CL, errs, xNP, de, alphaN, success] = RunLoop(design, alpha, i1, plotFlag)
% [CL, errs] = RunLoop(design, alpha, iteration) returns the cl and 
% error for a given design and alpha run. 

    % set up
    avlLocation = '.\avl.exe';
    nameList = design.runs.name;
    runs = design.runs;
    const = runs.const;
    success = 1;
    
    if isnan(alpha) ~= 1
        const.a = alpha;       % set
    end
    
    % display info
    if plotFlag ~= 1 
        if isnan(alpha) ~= 1
%             disp(['Loop iteration: ', num2str(i1), ...
%                 ', Alpha [deg]: ', num2str(alpha)]);
        else
            %disp(['Loop iteration: ', num2str(i1)]);
        end
    end
    
    runs.name = nameList;
    runs.const = const;         % generic constraints
    design.runs = runs;
    runName = nameList;
   

    % write the files + run
    delete([runName, '.stabs']);
    delete([runName, '.strip']);
    delete([runName, '.mass']);
    delete([runName, '.avl']);
    delete([runName, '.run']);
    % [~, ~, runFile] = WriteAVL_D(design);
    % [~, ~, runFile] = WriteAVL_F(design); % use sail inertia tensor
    [~, ~, runFile] = WriteAVL_J(design);   % use sail inertia, use de = 15 deg
    fclose('all');
    [status, result] = dos([avlLocation,' < ', runFile]);
    
    if ~exist(append(runName,'.stabs'),'file')
        success = 0;
        return;
    end
    
    stabDerivs = ReadStabDerivs_revA([runName, '.stabs']);
    de = stabDerivs.elev;
    alphaN = stabDerivs.Alpha;
    xNP = stabDerivs.Xnp;
    
    [Cl, ~, ~, ~, ~, yLE] = ReadStrips([runName, '.strip'], 0, design);
    fclose('all');
    
    % get CL difference
    [Clmax] = getCLmax(design, yLE(:, 1));
    differr1 = Clmax - Cl(:, 1);
    [m1, indx1] = min(differr1);
    differr2 = Clmax - Cl(:, 2);
    [m2, indx2] = min(differr2);

    
    % return valuables
    CL = stabDerivs.CLtot;
    errs = min([m1, m2]);
    de = stabDerivs.elev;
    
    % plot if asked
    if plotFlag == 1
        figure
        hold on
        plot(yLE(:, 1), Clmax, 'r-')
        plot(yLE(:, 1), abs(Cl(:, 1)))
        plot(yLE(:, 2), abs(Cl(:, 2)), '-', 'Color', [0.4940    0.1840    0.5560])
        xlabel('Span position [m]')
        ylabel('Sectional lift coefficient')
        grid on
        grid minor
        title(['$C_{L}$ = ', num2str(CL), ...
            ', $\alpha_{Stall}$ = ', num2str(alpha), ' [deg]']);
        legend({'$C_{l_{max}}$', '$C_{l_{wing}}$', '$C_{l_{rudder}}$'}, ...
            'interpreter', 'latex', 'location', 'northwest');
        
        wing = design.wing;
        spn = wing.span;
        % set(gca, 'XTick', -1.6:0.4:0);
        % xlim([-spn, 0]);
        set(gca, 'YTick', 0:0.4:1.6);
        ylim([0, 1.6])
                
    end

end