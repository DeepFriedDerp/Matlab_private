function WriteSection(fID, x, y, z, chord, ainc, spanVort, Sspace, afil)
% Function to write the "SECTION" entry of the avl file
% INPUTS:
%   fID         - avl file id
%   x           - x entry
%   y           - y entry
%   z           - z entry
%   chord       - chord at section
%   ainc        - angle of attack of section
%   spanVort    - spanwise vortex number
%   Sspace      - spacing method on the wing
%   afil        - airfoil information
%       EXAMPLE:
%       NACA 0015  -> afil = 'NACA 0015' 
%       sd7037.dat -> afil = 'AFIL sd7037.dat' 

% Sspace=0.0; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% change later %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(fID, '%s\n', 'SECTION');                              % section
fprintf(fID, '%s\t%s\t%s\t%s\t%s\t%s\t%s\n', '! Xle', ...     % header
    'Yle', 'Zle', 'Chord', 'Ainc', 'Nspanwise', 'Sspace'); 
fprintf(fID, '%5.2f %5.2f %5.2f %5.2f %1.1f %d %1.1f\n', ...              % values
    x, y, z, chord, ainc, spanVort, Sspace); 
 

% add airfoil if needed
if isempty(afil) ~= 1
    a = strsplit(afil);     % get airfoil info and throw error if needed
    if length(a) ~= 2
        error(['afil value of "', afil, '" is not in the proper format.']);
    end
    
    fprintf(fID, '%s\n', cell2mat(a(1)));    % airfoil geometry
    fprintf(fID, '%s\n', cell2mat(a(2)));    % airfoil geometry
end

fprintf(fID, '\n');                      % blank line

end