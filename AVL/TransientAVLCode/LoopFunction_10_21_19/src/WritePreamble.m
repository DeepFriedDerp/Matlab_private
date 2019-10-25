function WritePreamble(fID, mach, sims, refs, offs, cdp, linewrite)
% Function to write the preamble entry of the avl file
% INPUTS:
%   fID         - avl file id
%   mach        - mach number
%   sims        - 3 x 1 vector of Xsym, Ysym, and Zsym flags
%   refs        - 3 x 1 vector of Sref, Cref, Bref values
%   offs        - 3 x 1 vector of Xref, Yref, Zref values
%   cdp         - profile drag coefficient
%   linewrite   - line for spacing

fprintf(fID, '%s\n', linewrite);                    % break line
fprintf(fID, '%s\n', 'TCS');
fprintf(fID, '%s\n', '! Mach');                         % mach number
fprintf(fID, '%1.1f\n', mach);                     % mach number
fprintf(fID, '%s\t%s\t%s\n', '! Xsym', 'Ysym', 'Zsym'); % sym flags
fprintf(fID, '%1.0f %1.0f %1.0f\n', sims(1), ...
    sims(2), sims(3));                % sym flags
fprintf(fID, '%s\t%s\t%s\n', '! Sref', 'Cref', 'Bref'); % ref flags
fprintf(fID, '%5.1f %5.1f %5.1f\n', refs(1), ...
    refs(2), refs(3));
fprintf(fID, '%s\t%s\t%s\n', '! Xref', 'Yref', 'Zref'); % ref flags
fprintf(fID, '%6.2f %6.2f %6.2f\n', offs(1), ...
    offs(2), offs(3));
fprintf(fID, '%s\n', '! CDp');                          % CDp number
fprintf(fID, '%s\n', num2str(cdp));                % CDp number
fprintf(fID, '\n');

end