function [rotationMatrixFinal] = frame2frameRotationMatrixGen(rotationSequence,eulerAngles)
%frame2frameRotationMatrixGen Constructs an reference frame to reference frame rotation matrix
%
%   DEPENDENCIES : elementalRotationMatrix.m
%
%   FORMAT : [rotationMatrixFinal] = frame2frameRotationMatrixGen(rotationSequence,eulerAngles)
%
%   ARGUMENTS :
%       OUTPUT rotationMatrixFinal : The square, symbolic rotation matrix
%
%       INPUT rotationSequence : a 1x3 char array which describes the
%       rotation sequences in order from left to right, valid element choices
%       are x,X,y,Y,z,Z, enclosed in ''.
%
%       INPUT eulerAngles : a 1x3 array of symbolic variables representing
%       the euler angles about which the corresponding axis in
%       rotationSequence will be rotated.

% validate that the number of arguments is correct
nargoutchk(1,1); 
narginchk(2,2);

%setup accepted input argument classes, and any required values and
%attributes for each argument
inputClasses = {'char','sym'};
rotationSequence_AcceptedVals = {'x','X','y','Y','z','Z'};


%validate the rotationSequence input argument (char array)
validateattributes(rotationSequence,inputClasses(1),{'nonempty'});
rotationSequence = validatestring(rotationSequence,rotationSequence_AcceptedVals);

%valide the eulerAngles input argument
validateattributes(eulerAngles,inputClasses(2),{'nonempty'});
if(size(eulerAngles) < size(rotationSequence))
    error('NOT ENOUGH EULER ANGLES FOR FULL ROTATION SEQUENCE')
end

%let the user know you're starting the build process
fprintf('Starting Rotation Matrix Build for sequence ')

%create the builder matrix for the rotation array
rotationMatrixBuild = sym(eye(3));
for(i = 1:size(rotationSequence))
    fprintf(', ')
    newElementalRotationMatrix = elementalRotationMatrix(rotationSequence(i),eulerAngles(i));
    rotationMatrixBuild = rotationMatrixBuild * newElementalRotationMatrix;
    fprintf('%c',rotationSequence(i))
end
fprintf(

fprintf('Final Rotation Matrix Constructed...\n')
rotationMatrixFinal = rotationMatrixBuild;
end
    