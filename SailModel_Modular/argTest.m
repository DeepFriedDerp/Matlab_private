function [whut] = argTest(arg1)
    narginchk(0,1)
    switch nargin
        case 0
            disp("no arguments presented")
            arg1 = [];
        case 1
            disp("1 argument is presented")
    end
    whut = isempty(arg1)
end