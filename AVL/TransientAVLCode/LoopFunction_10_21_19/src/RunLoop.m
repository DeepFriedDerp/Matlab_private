function [success] = RunLoop(design, alpha, i1, plotFlag)
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
%     
    runs.name = nameList;
    runs.const = const;         % generic constraints
    design.runs = runs;
    runName = nameList;
   

    % write the files + run
    delete([runName, '.stabs']);
    %delete([runName, '.strip']);
    %delete([runName, '.mass']);
    delete([runName, '.avl']);
    delete([runName, '.run']);
    % [~, ~, runFile] = WriteAVL_D(design);
    % [~, ~, runFile] = WriteAVL_F(design); % use sail inertia tensor
    [~, ~, runFile] = WriteAVL_J(design);   % use sail inertia, use de = 15 deg
    fclose('all');
    [status, result] = dos([avlLocation,' < ', runFile]);
    if ~exist(append(runName,'.stabs'),'file')
        status
        success = 0;
        return;
    end
    
    %stabDerivs = ReadStabDerivs_revA([runName, '.stabs']);
%     de = stabDerivs.elev;
%     alphaN = stabDerivs.Alpha;
%     xNP = stabDerivs.Xnp;
%     % [Cl, ~, ~, ~, ~, yLE] = ReadStrips([runName, '.strip'], 0, design);
%     fclose('all');
%     errs = NaN;
%     alphaN = NaN;
%     
%     % return valuables
%     CL = stabDerivs.CLtot;
%     % errs = min([m1, m2]);
%     de = stabDerivs.elev;
%     

end