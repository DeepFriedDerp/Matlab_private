%% INPUT

clear all;

de =    0;  % elevator deflection, degress
    
x1_0 =  0;  % rBO_X_B, meters
x2_0 =  76.2;  % rBO_Y_B, meters
x3_0 =  0;  % rBO_Z_B, meters
x4_0 =  pi()/2;  % phi, radians
x5_0 =  0;  % theta, radians
x6_0 =  0;  % psi, radians
x7_0 =  0;  % O_vBO_X_B, meters / second
x8_0 =  0;  % O_vBO_Y_B, meters / second
x9_0 =  0;  % O_vBO_Z_B, meters / second
x10_0 = 0;  % O_phi_d, radians / second
x11_0 = 0;  % O_theta_d, radians / second
x12_0 = 0;  % O_psi_d, radians / second

vWO_X =     -5;  % IRF windspeed X, meters / second
vWO_Y =     0;  % IRF windspeed Y, meters / second
vWO_Z =     0;  % IRF windspeed Z, meters / second



%% setup stuff


load res5;

x_names = ["xB";"yB";"zB";"phi";"theta";"psi";"vxB";"vyB";"vzB";"phidot";"thetadot";"psidot"];
x_0 = [x1_0 x2_0 x3_0 x4_0 x5_0 x6_0 x7_0 x8_0 x9_0 x10_0 x11_0 x12_0];

settings.alpha_max = deg2rad(settings.alpha_max);
settings.alpha_min = deg2rad(settings.alpha_min);
settings.beta_max = deg2rad(settings.beta_max);
settings.beta_min = deg2rad(settings.beta_min);

global otherstuff derp herp aeroForces
otherstuff.settings = settings;
otherstuff.results = results;
otherstuff.de = de;
otherstuff.vWO_X = vWO_X;
otherstuff.vWO_Y = vWO_Y;
otherstuff.vWO_Z = vWO_Z;

% [successFindAero ,aeroTriggers] = findAeroConfig( ... 
%            settings,currentConfig);
% if successFindAero
%     aeroTriggersLast = aeroTriggers;
% else
%     error("can't initialize aeroTriggers")
% end

[t,x] = ode45(@SailFunc,[0 5],x_0);

figure
for i = 1 : size(x,2)
    subplot(4,3,i);
    plot(t,x(:,i));
    title(x_names(i));
end
    
%% PLOT INTERMEDIATE STUFF FOR SIM THAT HANGS UP
herp_labels = ["alpha"; "beta"; "windspeed"; "p"; "q"; "r"; "d_tether"; "Tx"; "Ty"; "Tz"];
aeroLabels = ["CL"; "CD"; "CY"; "Cl"; "Cm"; "Cn"; "L"; "D"; "Y"; "l"; "m"; "n"];
figure
for i = 2 : size(derp,2)
    subplot(4,3,i-1);
    plot(derp(:,1),derp(:,i));
    title(x_names(i-1));
end
%%
figure
for i = 2 : size(herp,2)
    subplot(4,3,i-1)
    plot(herp(:,1),herp(:,i));
    title(herp_labels(i-1));
end

%%
figure
for i = 2 : size(aeroForces,2)
    subplot(4,3,i-1)
    plot(aeroForces(:,1),aeroForces(:,i));
    title(aeroLabels(i-1));
end