function [info] = LoadFile(filename)

fclose('all');

actFileName = append(".\inputFiles\",filename);

fid = fopen(actFileName);

newline = fgetl(fid);
while newline ~= -1
    eval(newline);
    newline = fgetl(fid);
    
end
fclose(fid);

info.mass1 = mass1;
info.mass2 = mass2;
info.mass3 = mass3;
info.mass4 = mass4;
info.mass5 = mass5;
info.mass6 = mass6;
info.mass7 = mass7;
info.SM = SM;
info.xNP = xNP;
info.yLyCM = yLyCM;
info.span = span;
info.chord = chord;
info.yT = yT;
info.xoff = xoff;

if exist('avlname', 'var') == 1
    info.avlname = avlname;
end 

% set run conditions
alfaFlag = NaN;
CLFlag = NaN;
deFlag = NaN;
stallFlag = NaN;
info.alfaFlag = alfaFlag;
info.CLFlag = CLFlag;
info.deFlag = deFlag;
info.stallFlag = stallFlag;
if exist('alfa', 'var') == 1
    alfaFlag = 1;
    info.alfaFlag = alfa;
end
if exist('CL', 'var') == 1
    CLFlag = 1;
    info.CLFlag = CL;
end
if exist('de', 'var') == 1
    deFlag = 1;
    info.deFlag = de;
end
if sum([alfaFlag, CLFlag, deFlag]) == 0
    stallFlag = 1;
    info.stallFlag = 1;
end

% check for user input errors
if sum([isnan(alfaFlag), isnan(CLFlag), isnan(deFlag)]) < 2
    error('User has specified more than just alfa, CL, or de.');
end



end