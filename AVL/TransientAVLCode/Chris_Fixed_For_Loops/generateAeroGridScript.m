clear all;

settings.runfile = '.\inputFiles\Classic_rev1_alfa2.txt';
settings.gridFolder = 'Grid_RES_3';

settings.alpha_max = 15;
settings.alpha_min = -15;
settings.alpha_res = 3;

settings.beta_max = 5;
settings.beta_min = -5;
settings.beta_res = 3;

settings.de_max = 15;
settings.de_min = -15;
settings.de_res = 3;

settings.vel_max = 10;
settings.vel_min = 3;
settings.vel_res = 3;

settings.p_max = 0.5;
settings.p_min = -0.5;
settings.p_res = 3;

settings.q_max = 1.5;
settings.q_min = -1.5;
settings.q_res = 3;

settings.r_max = 1.0;
settings.r_min = -1.0;
settings.r_res = 3;

[linGridSuccess,NP_X] = createAeroGridInterp(settings);

