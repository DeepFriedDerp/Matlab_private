function [aeroForces] = paramSpace_3_3_3_3_2_2_3(sailStates,airStates)

	CL = (4.016153)*sailStates.alpha + (-0.028476)*sailStates.beta + (-2.826759)*sailStates.p + (37.085747)*sailStates.q + (0.372259)*sailStates.r + (0.011154)*sailStates.de;
	CD = 0.033490;
	CY = (0.001949)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.093690)*sailStates.p + (-0.065300)*sailStates.q + (-0.006143)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.324090)*sailStates.alpha + (-0.052530)*sailStates.beta + (-1.404233)*sailStates.p + (11.557729)*sailStates.q + (0.267612)*sailStates.r + (0.000645)*sailStates.de;
	Cm = (-14.526447)*sailStates.alpha + (0.112818)*sailStates.beta + (9.623630)*sailStates.p + (-144.341232)*sailStates.q + (-1.271327)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (-0.075537)*sailStates.alpha + (0.003029)*sailStates.beta + (-0.121689)*sailStates.p + (0.268629)*sailStates.q + (-0.003558)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end