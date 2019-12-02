function [success] = AVLMainTwo(alpha, beta, de, p1, q1, r1, vel)

success = 0;


Sref = 0.4;
Bref = 1.4;
Cref = 0.3;
rho = 1.225;

runFile = 'augustModel.run';
avlFile = 'augustModel.avl';
massFile = 'augustModel.mass';
stabsFile = 'augustModel.stabs';
avlLoc = 'avl.exe';

r = (p1*Bref) / (2*vel);        % roll rate (p)
p = (q1*Cref) / (2*vel);        % pitch rate (q)
y = (r1*Bref) / (2*vel);        % yaw rate (r)

%% write the runfile

FID = fopen(runFile,'w');

fprintf(FID,"load %s\n",avlFile);
fprintf(FID,"mass %s\n",massFile);
fprintf(FID,"mset\n");
fprintf(FID,"0\n");
fprintf(FID,"PLOP\n");
fprintf(FID,"g\n\n");

fprintf(FID,"OPER\n");
fprintf(FID,"m\n");
fprintf(FID,"v %.4f\n", vel);
fprintf(FID,"mn 0.0000\n");
fprintf(FID,"g 9.8100\n");
fprintf(FID,"d 1.2250\n\n");

fprintf(FID,"a a %.4f\n", alpha);
fprintf(FID,"d1 d1 %.4f\n", de);
fprintf(FID,"b b %.4f\n", beta);
fprintf(FID,"r r %.4f\n", r);
fprintf(FID,"p p %.4f\n", p);
fprintf(FID,"y y %.4f\n", y);
fprintf(FID,"x\n");

if exist(stabsFile)
    fprintf(FID,"st %s\n",stabsFile);
    fprintf(FID,"o\n\n");
else
    fprintf(FID,"st %s\n\n",stabsFile);
end

fprintf(FID,"QUIT");

fclose(FID);

%% call the runfile

[status, result] = dos([avlLoc,' < ', runFile]);
%fprintf("status : %s , result : %s\n", string(status), string(result));

%% check for stabs and parse if its there

if exist(stabsFile)
    success = 1;
end

end