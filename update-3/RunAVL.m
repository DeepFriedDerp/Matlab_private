% runAVL to generate nominal case files for later use
% CDY, 2019-12-30

% preamble
clc
close all
clear 
fclose('all');
avldir = 'avl-runs';

% nominal parameters
d = 1.225;
g = 9.81;
v = 5.00;

% options for setting avl analysis
% Need to define six (defaults are everthing set to zero in AVL)
% a   ->  alpha setting
% b   ->  beta
% r   ->  pb/2V rate
% p   ->  qc/2V
% y   ->  rb/2V
% c   ->  CL
% s   ->  CY
% RM  ->  Cl, rolling moment
% PM  ->  Cm, pitching moment
% YM  ->  Cn, yawing moment
% d1  ->  elevator

% % case-1, 
% newdir = fullfile(avldir, 'case-1');
% avlfile = 'cm_calc_1.avl';
% a = 'a c 0.5';  % set alfa so CL is 0.2
% b = 'b b 0';    % set beta to zero
% d = 'd1 pm 0';  % de so pitching moment is zero (trim)
% r = 'r p 0';
% p = 'p q 0';
% y = 'y r 0';

% case-2, 
% newdir = fullfile(avldir, 'case-2');
newdir = fullfile(avldir, 'case-3');
avlfile = 'cm_calc_3.avl';
m = 1.991;
a = 'a a -5';  % set alfa so CL
b = 'b b 0';    % set beta to zero
e = 'd1 d1 12';  % de so pitching moment is zero (trim)
r = 'r p 0';
p = 'p q 0';
y = 'y r 0';

% write run file
t1 = strsplit(avlfile, '.');
basefile = t1{1};
runfile = fullfile(newdir, [basefile, '.run']);
fid = fopen(runfile, 'w');                                  % open file
fprintf(fid, 'load %s\n', fullfile(newdir, avlfile));       % load avl file
fprintf(fid, 'oper\n');                                     % oper menu
fprintf(fid, 'm\n');                                        % set environment 
fprintf(fid, 'd %0.4f\n', d);                               % density
fprintf(fid, 'g %0.4f\n', g);                               % gravity
fprintf(fid, 'v %0.4f\n', v);                               % velocity
fprintf(fid, 'm %0.4f\n', m);                               % mass
fprintf(fid, '\n');                                         % back to oper menu
fprintf(fid, '%s\n', a);                                    % alpha
fprintf(fid, '%s\n', b);                                    % beta
fprintf(fid, '%s\n', e);                                    % elevator
% fprintf(fid, '%s\n', r);                                    % rolling
% fprintf(fid, '%s\n', p);                                    % pitching
% fprintf(fid, '%s\n', y);                                    % yawing
fprintf(fid, 'x\n');                                        % run the analysis
fprintf(fid, 'st %s\n', fullfile(newdir, [basefile, '.stabs']));
fprintf(fid, 'sb %s\n', fullfile(newdir, [basefile, '.bodys']));
% fprintf(fid, 're %s\n', fullfile(newdir, [basefile, '.refs']));
fprintf(fid, 'ft %s\n', fullfile(newdir, [basefile, '.force']));
fprintf(fid, 'fn %s\n', fullfile(newdir, [basefile, '.surfs']));
fprintf(fid, 'fs %s\n', fullfile(newdir, [basefile, '.strip']));
fprintf(fid, 'fe %s\n', fullfile(newdir, [basefile, '.elmts']));
fprintf(fid, 'fb %s\n', fullfile(newdir, [basefile, '.bfrce']));
fprintf(fid, 'hm %s\n', fullfile(newdir, [basefile, '.hinge']));
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, 'quit\n');
fclose(fid);

% delete old files
delete(fullfile(newdir, [basefile, '.stabs']));
delete(fullfile(newdir, [basefile, '.bodys']));
delete(fullfile(newdir, [basefile, '.force']));
delete(fullfile(newdir, [basefile, '.surfs']));
delete(fullfile(newdir, [basefile, '.strip']));
delete(fullfile(newdir, [basefile, '.elmts']));
delete(fullfile(newdir, [basefile, '.bfrce']));
delete(fullfile(newdir, [basefile, '.hinge']));

% run it!
cmds = sprintf('%s < %s', fullfile(avldir, 'avl.exe'), runfile);
status = system(cmds);