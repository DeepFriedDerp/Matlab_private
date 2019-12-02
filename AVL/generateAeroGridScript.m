clear all;

%settings.runfile = 'Classic_rev1_alfa3.txt';
%settings.gridFolder = 'Grid_RES_1';

settings.alpha_max = 15;
settings.alpha_min = -15;
settings.alpha_res = 5;

settings.beta_max = 10;
settings.beta_min = -10;
settings.beta_res = 3;

settings.de_max = 15;
settings.de_min = -15;
settings.de_res = 5;

settings.vel_max = 10;
settings.vel_min = 1;
settings.vel_res = 1;

settings.p_max = 1;
settings.p_min = -1;
settings.p_res = 2;

settings.q_max = 3.1;
settings.q_min = -3.1;
settings.q_res = 2;

settings.r_max = 2;
settings.r_min = -2;
settings.r_res = 2;

[linGridSuccess,results] = create_AVL_Grid_2(settings);

results = fillGridGaps(results,settings);

settings.resultsGrid = results;

save res7.mat

