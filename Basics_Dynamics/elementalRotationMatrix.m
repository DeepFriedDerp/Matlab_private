function [elementalRotationMat] = elementalRotationMatrix(axisName,eulerAng,ndim)
%elementalRotationMatrix Constructs an elemental rotation matrix
%   
%   FORMAT : [elementalRotationMat] = elementalRotationMatrix(axisName,eulerAng,ndim)
%
%   ARGUMENTS :
%       OUTPUT elementalRotationMat : The square, elemental rotation matrix of size
%       ndim
%
%       INPUT axisName : The axis name (e.g. 'x' for the x-axis). char type
%       that can be either x, y, or z.
%
%       INPUT eulerAng : The symbolic function handle for which euler angle you are
%       rotating about the scoped axis
%
%       INPUT ndim : The number of dimensions you are working with. This
%       version handles 2 and 3 dimensions only. If left blank, defaults to 3
%       dimensions.

% validate that the number of arguments is correct
nargoutchk(1,1); 
narginchk(2,3);

%setup accepted input argument classes, and any required values and
%attributes for each argument
inputClasses = {'char','sym','numeric'};
axisName_AcceptedVals = {'x','X','y','Y','z','Z'};
ndim_Attributes = {'>',1,'<',4};

%validate the axisName input argument (char)
validateattributes(axisName,inputClasses(1),{'nonempty'});

%validate the eulerAng input argument (symbolic function handle)
validateattributes(eulerAng,inputClasses(2),{'nonempty'});

%set a default value for the number of dimensions
numberOfDimensions = 3;

%if there are 3 arguments, validate the ndim input argument, and if its
%good, assign it in place of the default value to numberOfDimensions.
if(nargin > 2)
    rotationAxis = validatestring(axisName,axisName_AcceptedVals);
    validateattributes(ndim,inputClasses(3),ndim_Attributes);
    numberOfDimensions = ndim;
else
    rotationAxis = validatestring(axisName,axisName_AcceptedVals(5:6));
end

fprintf('Creating elemental rotation matrix %c\n',rotationAxis)

% generate the symbolic square matrix that will become the rotation matrix,
% size of the matrix is determined by the number of dimensions
if(numberOfDimensions > 2)
    rotationMatrixBuild = sym(eye(3));
    
    %based on the rotation axis name, construct the rest of the rotation matrix
    if(rotationAxis == 'x' || rotationAxis == 'x')
        rotationMatrixBuild(2,2) = cos(eulerAng);
        rotationMatrixBuild(3,3) = cos(eulerAng);
        rotationMatrixBuild(3,2) = sin(eulerAng);
        rotationMatrixBuild(2,3) = -sin(eulerAng);
    elseif(rotationAxis == 'y' || rotationAxis == 'y')
        rotationMatrixBuild(1,1) = cos(eulerAng);
        rotationMatrixBuild(3,3) = cos(eulerAng);
        rotationMatrixBuild(1,3) = sin(eulerAng);
        rotationMatrixBuild(3,1) = -sin(eulerAng);
    elseif(rotationAxis == 'z' || rotationAxis == 'z')
        rotationMatrixBuild(1,1) = cos(eulerAng);
        rotationMatrixBuild(2,2) = cos(eulerAng);
        rotationMatrixBuild(2,1) = sin(eulerAng);
        rotationMatrixBuild(1,2) = -sin(eulerAng);
    end
else
    %it doesn't have to be an identity, it just generates a square symbolic 
    %matrix of dimension 2.
    rotationMatrixBuild = sym(eye(2));
    
    %since a rotation in the x,y plane is always about the z-axis, just
    %use the x,y components of the elemental z-rotation matrix
    rotationMatrixBuild(1,1) = cos(eulerAng);
    rotationMatrixBuild(2,2) = cos(eulerAng);
    rotationMatrixBuild(2,1) = sin(eulerAng);
    rotationMatrixBuild(1,2) = -sin(eulerAng);
end

fprintf('Elemental Rotation Matrix created!\n')

%Set the output argument to the final result
elementalRotationMat = rotationMatrixBuild;
end

