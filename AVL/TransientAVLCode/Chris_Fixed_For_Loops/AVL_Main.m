function [success] =  AVL_Main(filename, alfa1, beta, delta, p1, q1, r1)
% Script to compute the center of mass and intertia tensor of the sail

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % %          User inputs          % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% masses - defined in the global frame
% io = out the nose
% jo = towards balloon altitude
% ko = RHR, into the plane
% The origin of the O frame is at the pitch ballast
% set SM and yLyCM to desired values and the code will use double golden
% section to choose the masses to make it happen

success = 1;

% set plot stuffs
SetDefaults;

% load and rename variables
[info,success_Load] = LoadFile(filename);
if ~success_Load
    disp("fail to load")
    %disp(info);
    success = 0;
    return;
end

alfa = alfa1;
mass1 = info.mass1;
mass2 = info.mass2;
mass3 = info.mass3;
mass4 = info.mass4;
mass5 = info.mass5;
mass6 = info.mass6;
mass7 = info.mass7;
SM = info.SM;
xNP = info.xNP;
oldXNP = xNP;
yLyCM = info.yLyCM;
span = info.span;
chord = info.chord;
yT = info.yT;
xoff = info.xoff;
info.inputfile = filename;
if isfield(info, 'avlname') == 1
    sail.name = info.avlname;
end 


% find the design
xout = MathSail(info, 3, xNP, yT);   % get all stuffs
errSM = abs(SM - xout.PitchSM);
errYM = abs(yLyCM - xout.RollSM);
cntr = 1;
exitFlag = 0;
errtol = 0.0001;
AVLexitFlag = 0;
cntrlimit = 100;
plotFlag = 0;
rollmasshistory = NaN(cntrlimit, 1);
pitchmasshistory = NaN(cntrlimit, 1);
if isnan(SM) == 0
    PitchFlag = 1;
else
    PitchFlag = 0;
end
if isnan(yLyCM) == 0
    RollFlag = 1;
else
    RollFlag = 0;
end
errSM = NaN;
errYM = NaN;


for j1 = 1:2
    
    while exitFlag == 0
        
        % pitch SM, 1==PitchSM, SM==DesiredSM
        if PitchFlag == 1                               % if want pitch iteration
            mass_C = IterSail(info, 1, SM, xNP, yT);    % get required pitch ballast
            mass5.mass = mass_C;                        % set the new structure
            info.mass5 = mass5;                         % update big structure
            errSM = abs(SM - xout.PitchSM);             % error in static margin
            if mass_C == 0 || mass_C == 1000            % if mass == 0
                errSM = 0;                              % skip SM error
                PitchFlag = 0;                          % skip pitch iterations
            end
%             xout.PitchSM
%             errSM
%             mass_C
%             keyboard
        end

        % roll SM, 2==RollSM, SM==DesiredSM
        if RollFlag == 1
            mass_C = IterSail(info, 2, yLyCM, xNP, yT);
            mass6.mass = mass_C;
            info.mass6 = mass6;
            xout = MathSail(info, 3, xNP, yT);
            errYM = abs(yLyCM - xout.RollSM);
            if mass_C == 0 || mass_C == 1000
                errYM = 0;
                RollFlag = 0;
            end
        end

        xout = MathSail(info, 3, xNP, yT);
        rollmasshistory(cntr) = mass6.mass;
        pitchmasshistory(cntr) = mass5.mass;
        if cntr > cntrlimit
            warning('Convergence not met before iteration limit.');
            exitFlag = 1;
            % fprintf('Error of %0.4f is less than tolerance of %0.4f\n', ...
            %     abs(errSM + errYM), errtol);
        elseif abs(errSM + errYM) <= errtol 
            exitFlag = 1;
        end
        cntr = cntr + 1;

    end
    exitFlag = 0;
    % sail = xout.sail;
    sail.mT = xout.sail.mT;
    sail.Xcm = xout.sail.Xcm;
    sail.Ycm = xout.sail.Ycm;
    sail.Zcm = xout.sail.Zcm;
    
    xNP = xout.xNP;
    PitchSM = xout.PitchSM;
    yL = xout.yL;
    RollSM = xout.RollSM;
    ICM = InertiaTensorCalc(sail, info);
    

    if plotFlag == 1 
        figure
        hold on
        plot(rollmasshistory, '-o');
        plot(pitchmasshistory, '-s');
        xlabel('Iteration');
        ylabel('Mass [kg]');
        grid on
        legend({'Roll', 'Pitch'}, 'location', 'best');
    end
    % keyboard

    % AVL file
    while AVLexitFlag == 0
        % run AVL to find neutral point
        % pack up
        sail.mass1 = mass1;
        sail.mass2 = mass2;
        sail.mass3 = mass3;
        sail.mass4 = mass4;
        sail.mass5 = mass5;
        sail.mass6 = mass6;
        sail.mass7 = mass7;
        sail.xoff = xoff;
        sail.ICM = ICM;
        % sail.alfaFlag = info.alfaFlag;
        % sail.CLFlag = info.CLFlag;
        % sail.deFlag = info.deFlag;
        % sail.stallFlag = info.stallFlag;
        sail.alfa = alfa;
        sail.delta = delta;
        sail.beta = beta;
        sail.p1 = p1;
        sail.q1 = q1;
        sail.r1 = r1;
        [xNP, alfa, CL, q, de,successTranslate] = TranslateToAVL(sail);
        if ~successTranslate
            disp("failed to translate to AVL")
            success = 0;
            return;
        end
        % [xNP, alfa, CL, q] = TranslateToAVL_RUDDER(sail);
        xNP = -xNP;
        sail.xNP = xNP;
        info.xNP = xNP;
        info.de = de;
        AVLexitFlag = 1;
        % sail
    end
    

end

% pack and go
xout = MathSail(info, 3, xNP, yT);
info.ICM = ICM;
info.SM = xout.PitchSM;
info.yL = xout.yL;
info.xNP = xNP;
info.yT = yT;
info.yLyCM = RollSM;
info.alfa = alfa;
info.CL = CL;
info.q = q;



% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % %          Let 'em know             % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


% plot system
clrs = [         0    0.4470    0.7410
    0.8500    0.3250    0.0980
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.4660    0.6740    0.1880
    0.3010    0.7450    0.9330
    0.6350    0.0780    0.1840
    255/255, 153/255, 255/255];
figure
hold on
% wing
xv1 = [0, 0, -mass1.chord, -mass1.chord, 0] + mass1.xle;
yv1 = [0, mass1.yCM*2, mass1.yCM*2, 0, 0];  % assume yCM = span/2 for drawing
% rudder
xv2 = [0, 0, -mass2.chord, -mass2.chord, 0] + mass2.xle;
yv2 = [0, mass2.yCM*2, mass2.yCM*2, 0, 0];
plot(xv1, yv1, 'k-');
plot(xv2, yv2, 'k-');
% plot([mass5.xCM, -3.5*wing_chord - xoff - mass1.chord], [0, 0], 'k-', 'LineWidth', 1);
plot([0, 2*mass3.xCM], [0, 0], 'k-', 'LineWidth', 1);
p1 = plot(mass1.xCM, mass1.yCM, 's', 'DisplayName', 'Wing', 'MarkerSize', 8, 'MarkerFaceColor', clrs(1, :), 'MarkerEdgeColor', 'k');
p2 = plot(mass2.xCM, mass2.yCM, 's', 'DisplayName', 'Rudder', 'MarkerSize', 8, 'MarkerFaceColor', clrs(2, :), 'MarkerEdgeColor', 'k');
p3 = plot(mass3.xCM, mass3.yCM, 's', 'DisplayName', 'Boom', 'MarkerSize', 8, 'MarkerFaceColor', clrs(3, :), 'MarkerEdgeColor', 'k');
p4 = plot(mass4.xCM, mass4.yCM, 's', 'DisplayName', 'Electroncis', 'MarkerSize', 8, 'MarkerFaceColor', clrs(4, :), 'MarkerEdgeColor', 'k');
p5 = plot(mass5.xCM, mass5.yCM, 's', 'DisplayName', 'Pitch ballast', 'MarkerSize', 8, 'MarkerFaceColor', clrs(5, :), 'MarkerEdgeColor', 'k');
p6 = plot(mass6.xCM, mass6.yCM, 's', 'DisplayName', 'Roll ballast', 'MarkerSize', 8, 'MarkerFaceColor', clrs(6, :), 'MarkerEdgeColor', 'k');
p8 = plot(mass7.xCM, mass7.yCM, 's', 'DisplayName', 'Plate', 'MarkerSize', 8, 'MarkerFaceColor', clrs(8, :), 'MarkerEdgeColor', 'k');
p7 = plot(sail.Xcm, sail.Ycm, 'o', 'MarkerSize', 8, 'DisplayName', 'Sail CM', 'MarkerFaceColor', clrs(7, :), 'MarkerEdgeColor', 'k');
plot(mass1.xCM, mass1.yCM, 's', 'MarkerSize', 8, 'MarkerFaceColor', clrs(1, :), 'MarkerEdgeColor', 'k');

% xlabel('X coordinate [m]', 'FontSize', 8);
% ylabel('Y coordinate [m]', 'FontSize', 8);
% grid on
% grid minor
set(gca, 'XDir', 'reverse'); 
% ylim([-2., 0.5]);
set(gca, 'YColor', 'w');
set(gca, 'YTick', []);
% xlim([-2, 0]);
set(gca, 'XTick', []);
set(gca, 'XColor', 'w');

% draw sail 
legend([p1, p2, p3, p4, p5, p6, p8, p7], 'location', 'best');

% sail 
% info
% keyboard

% send to output
WriteOutput(sail, info);

% save figures as pdfs
h =  findobj('type','figure');
n = length(h);
for i1 = 1:n
    saveas(h(n + 1 - i1), sprintf('cm_calc_fig%d', i1), 'pdf');
end



end