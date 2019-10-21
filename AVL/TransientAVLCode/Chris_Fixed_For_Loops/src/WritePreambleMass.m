function WritePreambleMass(fID, Lunit, Munit, Tunit, g, rho)
% Function to write the preamble for the mass files
% INPUTS:
%   fID     - File identifier
%   Lunit   - length unit
%   Munit   - mass unit
%   Tunit   - time unit
%   g       - gravity [Lunit/Tunit^2]
%   rho     - density [Munit/Lunit^3]

% user info
fprintf(fID, '%s \n', '! ');
fprintf(fID, '%s \n', '! TCS AUTO Mass File');
fprintf(fID, '%s \n', '! ');
fprintf(fID, '%s \n', '!xyz is the location of the item CG');
fprintf(fID, '%s \n', '!Ixx, ... are the inertias about the item CG');
fprintf(fID, '%s \n', '! ');
fprintf(fID, '%s \n', '!x back');
fprintf(fID, '%s \n', '!y right');
fprintf(fID, '%s \n', '!z up');
fprintf(fID, '%s \n', '! ');
fprintf(fID, '%s \n', '!x,y,z system must have origin as the AVL input file');
fprintf(fID, '%s \n', '! ');

% alv info
fprintf(fID, '%s %6.4f %s \n', 'Lunit = ', Lunit, ' m');
fprintf(fID, '%s %6.4f %s \n', 'Munit = ', Munit, ' kg');
fprintf(fID, '%s %6.4f %s \n', 'Tunit = ', Tunit, ' s');
fprintf(fID, '%s \n', ' ');
fprintf(fID, '%s %6.4f\n', 'g = ', g);
fprintf(fID, '%s %6.4f\n', 'rho = ', rho);
fprintf(fID, '%s \n', ' ');
fprintf(fID, '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n', ...
    '! Mass', 'x', 'y', 'z', 'Ixx', 'Iyy', 'Izz', 'Ixy', 'Ixz', 'Iyz');
fprintf(fID, '%s \n', '! ');

end