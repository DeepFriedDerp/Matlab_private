%% INPUT

clear all;

de =    0;  % elevator deflection, degress
    
x1_0 =  0;  % rBO_X_B, meters
x2_0 =  0;  % rBO_Y_B, meters
x3_0 =  0;  % rBO_Z_B, meters
x4_0 =  0;  % phi, radians
x5_0 =  0;  % theta, radians
x6_0 =  0;  % psi, radians
x7_0 =  0;  % O_vBO_X_B, meters / second
x8_0 =  0;  % O_vBO_Y_B, meters / second
x9_0 =  0;  % O_vBO_Z_B, meters / second
x10_0 = 0;  % O_phi_d, radians / second
x11_0 = 0;  % O_theta_d, radians / second
x12_0 = 0;  % O_psi_d, radians / second

vWO_X =     5;  % IRF windspeed X, meters / second
vWO_Y =     0;  % IRF windspeed Y, meters / second
vWO_Z =     0;  % IRF windspeed Z, meters / second



%% setup stuff


load res5;

x_0 = [x1_0 x2_0 x3_0 x4_0 x5_0 x6_0 x7_0 x8_0 x9_0 x10_0 x11_0 x12_0];

settings.alpha_max = deg2rad(settings.alpha_max);
settings.alpha_min = deg2rad(settings.alpha_min);
settings.beta_max = deg2rad(settings.beta_max);
settings.beta_min = deg2rad(settings.beta_min);

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
clear t;
[t,y] = ode45(SailFunc(t,x,otherstuff),[0 1],x_0);
