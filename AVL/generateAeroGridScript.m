clear all;

%settings.runfile = 'Classic_rev1_alfa3.txt';
%settings.gridFolder = 'Grid_RES_1';

settings.alpha_max = 30;
settings.alpha_min = -30;
settings.alpha_res = 5;

settings.beta_max = 20;
settings.beta_min = -20;
settings.beta_res = 3;

settings.de_max = 20;
settings.de_min = -20;
settings.de_res = 20;

settings.vel_max = 15;
settings.vel_min = 0;
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

save aeroGrid.mat

