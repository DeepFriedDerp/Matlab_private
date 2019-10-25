clear all;

settings.runfile = 'Classic_rev1_alfa3.txt';
settings.gridFolder = 'Grid_RES_1';

settings.rho = 1.225;

settings.alpha_max = 15;
settings.alpha_min = -15;
settings.alpha_res = 2;

settings.beta_max = 10;
settings.beta_min = -10;
settings.beta_res = 2;

settings.de_max = 15;
settings.de_min = -15;
settings.de_res = 2;

settings.vel_max = 10;
settings.vel_min = 1;
settings.vel_res = 2;

settings.p_max = 1;
settings.p_min = -1;
settings.p_res = 2;

settings.q_max = 3.1;
settings.q_min = -3.1;
settings.q_res = 2;

settings.r_max = 2;
settings.r_min = -2;
settings.r_res = 2;
%%
[linGridSuccess,results] = create_AVL_Grid(settings);
%%
resultsFilled = fillGridGaps(results,settings);

settings.resultsGrid = resultsFilled;

save res1.mat

