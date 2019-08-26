function[stateDerivatives] = stateDerivative_isolate(expression,stateDerivativeSyms)
%stateDerivative_isolate Isolate your desired state derivative variables
%from a nonlinear, coupled system of equations
%
%   FORMAT : [stateDerivatives] = stateDerivative_isolate(expression,stateDerivativeSyms)
%
%   ARGUMENTS :
%       OUTPUT stateDerivatives : The complete symbolic system of equations
%       with each state derivative isolated to the LHS
%
%       INPUT expression : The symbolic column expression vector
%       representing the system of equations to extract the state
%       derivatives from
%
%       INPUT stateDerivativeSyms : The symbolic column vector (same size as
%       expression) containing the state derivatives as they appear in
%       expression.
%

%validate the number of arguments
nargoutchk(1,1);
narginchk(2,2);

%setup input argument classes, and any required values and attributes for
%each argument
inputClass = {'sym'};
inputAttributes = {'column','nonempty'};

%validate each argument for proper type and attributes
validateattributes(expression,inputClass,inputAttributes);
validateattributes(stateDerivativeSyms,inputClass,inputAttributes);

%get the number of equations (also number of state derivatives) to drive
%all operations, since they can vary in size
number_of_equations = size(expression,1);
number_of_stateDerivs = size(stateDerivativeSyms,1);

%setup necessary data fields
stateDeriv_strings = zeros(number_of_stateDerivs,1); % array of state derivative symbols converted to 
                         %   strings
expression_strings = zeros(number_of_equations,1); % array of expression symbolic funtions converted 
                         %   to strings
expression_strings = string(expression_strings);
stateDeriv_strings = string(stateDeriv_strings);

is_StateDeriv_in_expression = false; % matrix of logical values indicating
                                     %   if a state derivative exists in 
                                     %   each expression
%populate each array/matrix
for i = 1:number_of_stateDerivs
    stateDeriv_strings(i) = string(stateDerivativeSyms(i));
end

for i = 1:number_of_equations
    expression_strings(i) = string(expression(i));
end

for i = 1:number_of_equations
    for j = 1:number_of_stateDerivs
        is_StateDeriv_in_expression(i,j) = contains(expression_strings(i),stateDeriv_strings(j),'IgnoreCase',true);
    end
end

%make copies of the input arguments
expressions_symbolic = expression;
stateDeriv_symbolic = stateDerivativeSyms;
solved_stateDeriv_final = stateDerivativeSyms;

number_of_solve_attempts = 0;

while dot(is_StateDeriv_in_expression*ones(number_of_equations,1),ones(1,number_of_stateDerivs)) ~= 0
    % check for how many solves you've tried, too many indicates that the
    % solver isn't working, quit program if it happens
    number_of_solve_attempts = number_of_solve_attempts + 1;
    if number_of_solve_attempts > number_of_stateDerivs
        error('crap, number of solve attempts exceeded number of vars to solve')
    end
    
    %setup a row-by-row logical array indicating the presense of state
    %derivatives in each expression. 
    equations_with_stateDerivs = is_StateDeriv_in_expression*ones(number_of_equations,1);
    
    %find a state derivative to solve for that hasn't yet been isolated
    %from the system of equations
    current_sym_to_solve = 0;
    current_eq_to_solve = 0;
    for i = 1:number_of_equations
        if equations_with_stateDerivs(i)
            current_eq_to_solve = i;
            for j = 1:number_of_stateDerivs
                if is_StateDeriv_in_expression(i,j)
                    current_sym_to_solve = j;
                    break;
                end
            end
            break;
        end
    end
    
    %once you have the locations of the equation to solve and the state
    %derivative to stove for, perform the solve function and convert the
    %answer to a string
    solved_stateDeriv =simplify(solve((expressions_symbolic(current_eq_to_solve)),(stateDeriv_symbolic(current_sym_to_solve))));
    solved_stateDeriv_string = string(solved_stateDeriv);
    %if the solve function errors, but gives a solution, its in the form of
    %a 0x1 sym, so throw an error and exit if that happens
    if size(stateDeriv_symbolic(current_sym_to_solve),1) == 0
        error("crap, solving returned an error");
    end
    
    %search the string for any additional state derivatives. If there
    %aren't any left, then that equation is fully solved, and the result
    %can be added to the column array of final solutions, in the same order
    %as the stateDerivativeSyms argument.
    if contains(solved_stateDeriv_string,stateDeriv_strings) == 0
        solved_stateDeriv_final(current_sym_to_solve)=(solved_stateDeriv_string);
    end
    
    %substitute the solved form for the state derivative expression back 
    %into the symbolic array for working expressions
    expressions_symbolic = simplify(subs(expressions_symbolic, stateDeriv_symbolic(current_sym_to_solve), str2sym(solved_stateDeriv_string)));
    
    %its now time to convert the working expression array to strings,
    %search those strings for remaining state derivatives, and loop back to
    %the top.
    for i = 1:number_of_equations
        expression_strings(i) = string(expressions_symbolic(i));
    end

    for i = 1:number_of_equations
        for j = 1:number_of_stateDerivs
            is_StateDeriv_in_expression(i,j) = contains(expression_strings(i),stateDeriv_strings(j),'IgnoreCase',true);
        end
    end

end

stateDerivatives = solved_stateDeriv_final;
end
        
