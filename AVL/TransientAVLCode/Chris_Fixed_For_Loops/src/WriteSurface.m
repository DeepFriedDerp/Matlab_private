function WriteSurface(fID, names, chordVort, Cspace, spanVort, Sspace, linewrite)
% Function to write the "SURFACE" entry of the avl file
% INPUTS:
%   fID         - avl file id
%   chordVort   - number of chordwise vortices
%   names       - name of the surface
%   Cspace      - spacing parameter
%   spanVort    - spanwise vortex number
%   Sspace      - spacing method on the wing

fprintf(fID, '%s\n', linewrite);                            % break line
fprintf(fID, '%s\n', 'SURFACE ');                            % surface
fprintf(fID, '%s\n', names);                               % wing 
fprintf(fID, '%s\t%s\t%s\t%s\n', '! Nchordwise', ...        % headers 
    'Cspace', 'Nspanwise', 'Sspace'); 
fprintf(fID, '%d %1.1f %d %1.1f \n', chordVort, ...    % values
    Cspace, spanVort, Sspace);
fprintf(fID, '\n');                                         % newline

end