function [aeroForces] = paramSpace_1_2_2_2_3_3_1(sailStates,airStates)

	CL = (4.061889)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.022813)*sailStates.p + (28.854954)*sailStates.q + (0.082750)*sailStates.r + (0.009929)*sailStates.de;
	CD = -0.256250;
	CY = (0.025399)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.193884)*sailStates.p + (0.491414)*sailStates.q + (0.034187)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (0.957254)*sailStates.alpha + (-0.116544)*sailStates.beta + (-0.819902)*sailStates.p + (6.017220)*sailStates.q + (0.296644)*sailStates.r + (-0.000222)*sailStates.de;
	Cm = (-14.820983)*sailStates.alpha + (0.000000)*sailStates.beta + (7.407562)*sailStates.p + (-123.667763)*sailStates.q + (-0.238346)*sailStates.r + (-0.067234)*sailStates.de;
	Cn = (0.318240)*sailStates.alpha + (-0.020550)*sailStates.beta + (-0.571952)*sailStates.p + (2.540065)*sailStates.q + (-0.023052)*sailStates.r + (-0.000090)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end