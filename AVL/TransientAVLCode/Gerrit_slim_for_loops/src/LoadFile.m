function [info,successState] = LoadFile(filename)

fclose('all');

if ~exist(filename)
    info = 0;
    successState = 0;
    return;
end

fid = fopen(filename);

if fid < 0
    info = 0;
    successState = 0;
    return;
end

newline = fgetl(fid);
while newline ~= -1
    eval(newline);
    newline = fgetl(fid);
end
fclose(fid);

if ~exist('mass1','var')
    info = 0;
    successState = 0;
    return;
end

info.mass1 = mass1;
info.mass2 = mass2;
info.mass3 = mass3;
info.mass4 = mass4;
info.mass5 = mass5;
info.mass6 = mass6;
info.mass7 = mass7;
info.massT = massT;
% info.SM = SM;
info.xNP = xNP;
% info.yLyCM = yLyCM;
info.span = span;
info.chord = chord;
info.yT = yT;
info.xoff = xoff;

successState = 1;
end