% INPUT

clear all;

de =    0;

x1_0 =  0;
x2_0 =  -76.602;
x3_0 =  0;
x4_0 =  pi()/2;
x5_0 =  0;
x6_0 =  0;
x7_0 =  0;
x8_0 =  0;
x9_0 =  0;
x10_0 = 0;
x11_0 = 0;
x12_0 = 0;

vWO_X =     -5;
vWO_Y =     0;
vWO_Z =     0; 

tspan_min = 0;
tspan_max = 10;

% GO TO A UNIQUE FOLDER

load res9.mat;
results = resultsNew;

folderbase = 'SIM_OUTPUT';

folderCheck = 1;
folderIter = 0;

while folderCheck > 0 && folderIter < 100
	folderIter = folderIter + 1;

	if folderIter < 10
		iterString = append('0',string(folderIter));
	else
		iterString = string(folderIter);
	end

	folder_name = append(folderbase,iterString);

	if ~exist(folder_name,'dir')
		folderCheck = 0;
	end
end

if folderCheck < 1

	mkdir(folder_name);

else

	error('unique folder not found');

end

% setup stuff

x_names = ["xB";"yB";"zB";"phi";"theta";"psi";"vxB";"vyB";"vzB";"phidot";"thetadot";"psidot"];
x_0 = [x1_0 x2_0 x3_0 x4_0 x5_0 x6_0 x7_0 x8_0 x9_0 x10_0 x11_0 x12_0];

settings.alpha_max = deg2rad(settings.alpha_max);
settings.alpha_min = deg2rad(settings.alpha_min);
settings.beta_max = deg2rad(settings.beta_max);
settings.beta_min = deg2rad(settings.beta_min);

global otherstuff
otherstuff.settings = settings;
otherstuff.results = results;
otherstuff.de = de;
otherstuff.vWO_X = vWO_X;
otherstuff.vWO_Y = vWO_Y;
otherstuff.vWO_Z = vWO_Z;

[t,x] = ode45(@SailFunc,[tspan_min tspan_max],x_0);

figure
for i = 1 : size(x,2)
	subplot(4,3,i);
	plot(t,x(:,i));
	title(x_names(i));
end

	cd(folder_name);
save 'simResults.mat'
cd ..

GenerateLeftovers(folder_name,'simResults.mat','res9.mat');

