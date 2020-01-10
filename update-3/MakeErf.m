% makrerf
% GOAL: To make an erf dataset to handle stall conditions on the 
% main wing for lift
% Looks like L = CL(alpha)*erf

clc
close all
clear
fclose('all');

% x points
sa = 17;
x1 = -3:0.01:3;
y1 = erf(x1);
x2 = sa - 4:0.1:sa + 4;
y2 = 0.5 + -0.5*(erf((x2 - sa)*0.75));

% make interp data points
x3 = [-90, x2(1) - 2, x2, x2(end) + 2, 90];
y3 = [1, 1, y2, 0, 0];
F = griddedInterpolant(x3, y3);
save('stall-erf-v2.mat', 'x3', 'y3', 'sa', 'F');

% plot
figure
hold on
ax1 = gca;
line(x1, y1, 'color', ax1.ColorOrder(1, :));
ax1_pos = ax1.Position;
ax1.XColor = ax1.ColorOrder(1, :);
ax1.YColor = ax1.ColorOrder(1, :);
xlabel('x1')
ylabel('y1')
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', ...
    'YAxisLocation', 'right', 'color', 'none');
ax2.ColorOrderIndex = 2;
line(x2, y2, 'color', ax2.ColorOrder(2, :))% yyaxis right
ax2.XColor = ax2.ColorOrder(2, :);
ax2.YColor = ax2.ColorOrder(2, :);
xlabel('x2')
ylabel('y2')
grid on
xlim(ax2, [sa - 3, sa + 3])

% plot product
figure
hold on
CLa = 4.0857;
alfa = 0:0.1:25;
CL1 = CLa.*(alfa*pi/180);
CL2 = CLa.*(alfa*pi/180).*F(alfa);
plot(alfa, CL1);
plot(alfa, F(alfa));
plot(alfa, CL2);
xlabel('$\alpha$ [deg]');
grid on
legend({'$C_L$', 'F', '$C_L$*F'}, 'location', 'northwest');