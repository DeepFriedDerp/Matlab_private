function WriteControl(fID, cname, cgain, xhinge, hingeVec, sgndup)
% Function to write the "CONTROL" entry of the avl file
% INPUTS:
%   fID         - avl file id
%   cname       - name of the control
%   cgain       - control deflect. gain in deg/control variable
%   xhinge      - x/c location of the hinge
%   hingeVec    - 3 x 1 vector of hinge vector rotation
%   sgndup      - sign of deflection 
%       EXAMPLE: 
%       ailerons -> sgndup = -1
%       elevator -> sgndup = +1

fprintf(fID, '%s\n', 'CONTROL');                            % surface
fprintf(fID, '%s\t%s\t%s\t%s\t%s\n', ...
    '! Cname', 'Cgain', 'Xhinge', 'HingeVec', 'SgnDup'); 
fprintf(fID, '%s %1.1f %5.2f %1.1f %1.1f %1.1f %1.1f\n', ...
    cname, cgain, xhinge, hingeVec(1), hingeVec(2), ...
    hingeVec(3), sgndup);
fprintf(fID, '\n');                                         % newline

end