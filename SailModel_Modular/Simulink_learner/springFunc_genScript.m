syms x(t) k b m

r = x(t);
v = diff(r,t);
a = diff(r,2,t);

Fk = -k*r;
Fb = -b*v;

sumF = Fk + Fb;

eqn = sumF == m*a;

syms x xd xdd
regVect = [str2sym('x(t)') str2sym('diff(x(t), t)') str2sym('diff(x(t), t, t)')];
subVect = [x xd xdd];
eqn_sub = subs(eqn,regVect,subVect);

eqnSolved = simplify(solve(eqn_sub,xdd));

subVect2 = [str2sym('x(1)') str2sym('x(2)') str2sym('xdot(2)')];

eqnStates = subs(eqnSolved,subVect,subVect2);

FID = fopen('springFunc.m','w');
%%
fprintf(FID,'function [xdot] = springFunc(t,x)\n\n');
fprintf(FID,'\tm = 1;\n');
fprintf(FID,'\tk = 5;\n');
fprintf(FID,'\tb = 1;\n\n');
fprintf(FID,'\txdot(1) = x(2);\n');
fprintf(FID,'\txdot(2) = %s;\n\n',string(eqnStates));
fprintf(FID,"\txdot = xdot';\n\n");
fprintf(FID,'end');
%%
fclose(FID);

