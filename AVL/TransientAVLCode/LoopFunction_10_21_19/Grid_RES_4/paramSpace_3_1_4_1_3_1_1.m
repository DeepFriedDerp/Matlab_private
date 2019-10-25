function [aeroForces] = paramSpace_3_1_4_1_3_1_1(sailStates,airStates)

	CL = (6.868054)*sailStates.alpha + (-0.495164)*sailStates.beta + (-1.621258)*sailStates.p + (24.806652)*sailStates.q + (-2.438690)*sailStates.r + (0.009916)*sailStates.de;
	CD = -2.782760;
	CY = (0.683250)*sailStates.alpha + (-0.022135)*sailStates.beta + (-1.262678)*sailStates.p + (1.915496)*sailStates.q + (0.082962)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (2.126226)*sailStates.alpha + (0.385889)*sailStates.beta + (-0.517110)*sailStates.p + (2.879474)*sailStates.q + (-2.270476)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-16.381315)*sailStates.alpha + (1.844257)*sailStates.beta + (6.420541)*sailStates.p + (-112.650780)*sailStates.q + (8.213003)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-2.545766)*sailStates.alpha + (-0.043231)*sailStates.beta + (2.815886)*sailStates.p + (-14.365109)*sailStates.q + (-0.033989)*sailStates.r + (-0.000749)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end