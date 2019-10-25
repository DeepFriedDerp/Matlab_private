function WriteMassTable(fID, mass, xcg, ycg, zcg, ...
    IXX, IYY, IZZ, IXY, IXZ, IYZ, comm)
% Function to write a line of the mass table 
% INPUTS:
%   fID     - file identification
%   mass    - mass of the line
%   xcg     - xcg of line
%   ycg     - ycg of line
%   zcg     - zcg of line
%   IXX     - moment of inertia about x
%   IYY     - moment of inertia about y
%   IZZ     - moment of inertia about z
%   IXY     - product of inertia about xy
%   IXZ     - product of inertia about xz
%   IYZ     - product of inertia about YZ
%   comm    - any comments on the line

fprintf(fID, '%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%s\n', ...
    mass, xcg, ycg, zcg, IXX, IYY, IZZ, IXY, IXZ, IYZ, ['   ! ', comm]);

end