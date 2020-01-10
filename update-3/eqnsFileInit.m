function [EQNS, OcBm, OvBO_B, F] = eqnsFileInit(eqnsfile,stallfile)
 e1 = load(derivefile);

% read in equations for later
% --------------------------------------------------------
F = griddedInterpolant([-360, 360], [1, 1]);    % default object, all ones
if exist('stallfile', 'var') == 0
    % warning('stallfile not named in runfile. Using F = 1 (no stall).');
    fprintf('stallfile not named in runfile. Using F = 1 (no stall)\n');
elseif exist(stallfile, 'file') == 2
    e2 = load(stallfile);
    if isfield(e2, 'F') ~= 1
        % warning('stallfile does not have a  object F. Using F = 1 (no stall).');
        fprintf('stallfile does not have a  object F. Using F = 1 (no stall)\n');
        F = 1;
    else
        F = e2.F;
    end
else
    % warning('stallfile named in runfile but does not exist. Using F = 1 (no stall).');
    fprintf('stallfile named in runfile but does not exist. Using F = 1 (no stall)\n');
    F = 1;
end
% BCO = e1.BCA*e1.ACO;
BCO = e1.BCO;
OCB = transpose(BCO);
    fid2 = fopen(eqnsfile, 'r');
    newline = fgetl(fid2);
    newline = fgetl(fid2);
    for i1 = 1:9
        % MATLAB uses single index notation for matrices by
        % going down the first column, then second column, etc. Thus, the
        % indices would be (for a 4x3 matrix):
        % [1, 5, 9]
        % [2, 6, 10]
        % [3, 7, 11]
        % [4, 8, 12]
        EQNS{i1} = fgetl(fid2);
        % u_dot, v_dot, w_dot, theta_dot, phi_dot, psi_dot, p_dot, q_dot, r_dot
        OCBm{i1} = sprintf('%s', OCB(i1));
        % QCBm{i1} = sprintf('%s', QCB(i1));
        if i1 < 4
            OvBO_B{i1} = sprintf('%s', e1.O_V_BO_B(i1));
        end
    end
    fclose(fid2);
    fclose(fid1);
end