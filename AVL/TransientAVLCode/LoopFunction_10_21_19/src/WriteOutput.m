function WriteOutput(sail, info)
% 
% % unpack
% mass1 = info.mass1;
% mass2 = info.mass2;
% mass3 = info.mass3;
% mass4 = info.mass4;
% mass5 = info.mass5;
% mass6 = info.mass6;
% mass7 = info.mass7;

% intro stuff
fid = fopen([sail.name, '.out'], 'w');
fprintf(fid, '%% Sail CM calculation OUTPUT file\n');
fprintf(fid, '%% Created by:     %s\n', getenv('UserName'));
fprintf(fid, '%% Created on:     %s\n', char(datetime));
fprintf(fid, '%% Created using:  %s\n', getenv('UserDomain'));
fprintf(fid, '%% Input file:     %s\n', info.inputfile);

% performance results
fprintf(fid, '%% \n');
fprintf(fid, '%% Center of mass [m]: \n');
fprintf(fid, 'Xcm = %0.4f;\n', sail.Xcm);
fprintf(fid, 'Ycm = %0.4f;\n', sail.Ycm);
fprintf(fid, 'Zcm = %0.4f;\n', sail.Zcm);
fprintf(fid, '%% \n');
fprintf(fid, '%% Mass total [kg]: \n');
fprintf(fid, 'mT = %0.4f;\n', sail.mT);
fprintf(fid, '%% \n');
fprintf(fid, '%% Neutral point [m]: \n');
fprintf(fid, 'xNP = %0.4f;\n', info.xNP);
fprintf(fid, '%% \n');
fprintf(fid, '%% Static margin: \n');
fprintf(fid, 'SM = %0.4f;\n', info.SM);
fprintf(fid, '%% \n');
fprintf(fid, '%% X offset [m]: \n');
fprintf(fid, 'xoff = %0.4f;\n', info.xoff);
fprintf(fid, '%% \n');
fprintf(fid, '%% Spanwise coordinate of lift [m]: \n');
fprintf(fid, 'yL = %0.4f;\n', info.yL);
fprintf(fid, '%% \n');
fprintf(fid, '%% yLyCM ratio: \n');
fprintf(fid, 'yLyCM = %0.4f;\n', info.yLyCM);
fprintf(fid, '%% \n');
fprintf(fid, '%% Spanwise tether location [m]: \n');
fprintf(fid, 'yT = %0.4f;\n', info.yT);
fprintf(fid, '%% \n');
fprintf(fid, '%% Pitch ballast mass [kg]: \n');
fprintf(fid, 'PB = %0.4f;\n', info.mass5.mass);
fprintf(fid, '%% \n');
fprintf(fid, '%% Roll ballast mass [kg]: \n');
fprintf(fid, 'RB = %0.4f;\n', info.mass6.mass);
fprintf(fid, '%% \n');
fprintf(fid, '%% Total ballast mass [kg]: \n');
fprintf(fid, 'TB = %0.4f;\n', info.mass6.mass + info.mass5.mass);
fprintf(fid, '%% \n');
fprintf(fid, '%% Ballast mass ratio: \n');
fprintf(fid, 'BMR = %0.4f;\n', (info.mass6.mass + info.mass5.mass)/sail.mT);
fprintf(fid, '%% \n');
fprintf(fid, '%% Dynamic pressure [Pa]: \n');
fprintf(fid, 'q = %0.4f;\n', info.q);
fprintf(fid, '%% \n');
fprintf(fid, '%% Wing lift coefficient at stall: \n');
fprintf(fid, 'CL = %0.4f;\n', info.CL);
fprintf(fid, '%% \n');
fprintf(fid, '%% Rudder deflection [deg]: \n');
fprintf(fid, 'de = %0.4f;\n', info.de);
fprintf(fid, '%% \n');
fprintf(fid, '%% Wing angle of attack at stall [deg]: \n');
fprintf(fid, 'alfa = %0.4f;\n', info.alfa);
fprintf(fid, '%% \n');
fprintf(fid, '%% Lift [N]: \n');
wing_area = info.mass1.chord*info.mass1.span;
L = info.q*info.CL*wing_area;
fprintf(fid, 'L = %0.4f;\n', L);
g = 9.81;
fprintf(fid, '%% \n');
fprintf(fid, '%% Roll angle [deg]: \n');
theta = (180/pi)*abs(asin(info.yLyCM*L/(sail.mT*g)));
fprintf(fid, 'theta = %0.4f;\n', theta);
fprintf(fid, '%% \n');
fprintf(fid, '%% Guide force [N]: \n');
GF = abs(L*cosd(theta));
fprintf(fid, 'GF = %0.4f;\n', GF);

% close up shop
fclose(fid);

end
