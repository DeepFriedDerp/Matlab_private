function [SimFile_String] = ODE_FuncGen(xdot_Eqns,filename,otherEqns)
%ODE_FuncGen Constructs a .m file for running ODE simulations
%   
%   FORMAT : [SimFile_String] = ODE_FuncGen(xdot_Eqns,filename)
%
%   ARGUMENTS :
%       OUTPUT SimFile_String : The .m file of the formation [xdot] =
%       filename(t,x), where x represents the states,
%
%       INPUT xdot_Eqns : a column array of symbolic expressions 
%       that represents the state space equations that are equal to the state
%       derivatives(xdot), they should be in order from x1dot to xndot, and
%       the states should be written in the form x1 through xn
%
%       INPUT filename : the string representing the preffered filename of
%       the output .m file
%
%       INPUT otherEqns : an array of symbolic expressions or strings that
%       represents any other variable definitions that are used in
%       conjuction with the xdot_Eqns in order to properly calculate xdot,
%       make sure to follow the conventions laid out in xdot_Eqns with x1
%       through xn for the states

nargoutchk(1,1); 
narginchk(2,3);

%setup accepted input argument classes, and any required values and
%attributes for each argument
inputClasses = {'sym','char','string'};
inputAttributes = {'column'};
inputAttributes_filename = {'nonempty'};

%validate input arguments
validateattributes(xdot_Eqns,inputClasses,inputAttributes);
validateattributes(filename,inputClasses,inputAttributes_filename);
if nargin > 2
    validateattributes(otherEqns,inputClasses,inputAttributes);
end

%time to ensure that the equations provided are in the proper format
%cycle through the xdot_Eqns and otherEqns if necessary, converting them all into strings and looking
%generating an array for state derivative names, state names, and subbed
%state names (x1 will eventually be subbed to x(1))
for i = 1:size(xdot_Eqns)
    if isa(xdot_Eqns(i),'sym')
        xdot_Eqns_string(i) = string(xdot_Eqns(i));
    else
        xdot_Eqns_string(i) = xdot_Eqns(i);
    end
    stateDerivs_string(i) = convertCharsToStrings(sprintf('xdot(%u)',i));
    states_string(i) = convertCharsToStrings(sprintf('x%u',i));
    states2subtitute(i) = convertCharsToStrings(sprintf('x(%u)',i));
end

if nargin > 2
    for i = 1:size(otherEqns)
        if isa(otherEqns(i),'sym')
            otherEqns_string(i) = string(otherEqns(i));
        else
            otherEqns_string(i) = otherEqns(i);
        end
    end
end
        
%Now convert the strings into all sym functions, and sub state names for
%states2substitute names
xdot_Eqns_string = string(subs(xdot_Eqns,str2sym(states_string),str2sym(states2subtitute)));
% if nargin > 2
%     otherEqns_string = string(subs(otherEqns,str2sym(states_string),str2sym(states2subtitute)));
% end

%create and open the simfile
if contains(filename,'.m')
    edit(filename);
    FileID = fopen(filename,'w');
else
    filename = convertCharsToStrings(sprintf('%s.m',filename));
    edit(filename);
    FileID = fopen(filename,'w');
end
bare_filename = extractBefore(filename,'.m');

%construct the initial contents of the simfile
fprintf(FileID,'function xdot=%s(t,x)\n\n',bare_filename); 
     
%if otherEqns exists, go ahead and get it into string format and write to
%file
if nargin > 2
    for i = 1:size(otherEqns)
        fprintf(FileID,'%s;\n',otherEqns_string(i));
    end
    fprintf(FileID,'\n');
end

%Then write the equations
for i = 1:size(xdot_Eqns)
    fprintf(FileID,'%s = %s;\n',stateDerivs_string(i),xdot_Eqns_string(i));
end
fprintf(FileID,'\n');

%print the last few lines to complete the .m file and close it up
fprintf(FileID,"xdot=xdot';\n");
fprintf(FileID,'end');
fclose('all');

SimFile_String = bare_filename;
end


