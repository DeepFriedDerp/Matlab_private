clear all;

settings.runfile = 'Classic_rev2.txt';
settings.gridFolder = 'Grid_RES_1';

settings.alpha_max = 15;
settings.alpha_min = -15;
settings.alpha_res = 1;

settings.beta_max = 15;
settings.beta_min = -15;
settings.beta_res = 1;

settings.de_max = 15;
settings.de_min = -15;
settings.de_res = 1;

settings.vel_max = 10;
settings.vel_min = 1;
settings.vel_res = 1;

settings.p_max = 1;
settings.p_min = -1;
settings.p_res = 1;

settings.q_max = 2.3;
settings.q_min = -2.3;
settings.q_res = 1;

settings.r_max = 1.5;
settings.r_min = -1.5;
settings.r_res = 1;

linGridSuccess = createAeroGridInterp(settings);

