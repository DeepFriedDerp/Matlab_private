function [aeroForces] = paramSpace_3_4_4_1_3_1_1(sailStates,airStates)

	CL = (6.868054)*sailStates.alpha + (0.495163)*sailStates.beta + (-1.621258)*sailStates.p + (24.806652)*sailStates.q + (-2.438690)*sailStates.r + (0.009916)*sailStates.de;
	CD = -2.782760;
	CY = (0.683250)*sailStates.alpha + (-0.027437)*sailStates.beta + (-1.262678)*sailStates.p + (1.915496)*sailStates.q + (0.082962)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (1.932968)*sailStates.alpha + (0.714156)*sailStates.beta + (-0.419422)*sailStates.p + (1.670912)*sailStates.q + (-2.277006)*sailStates.r + (-0.000891)*sailStates.de;
	Cm = (-16.381313)*sailStates.alpha + (-1.844257)*sailStates.beta + (6.420541)*sailStates.p + (-112.650780)*sailStates.q + (8.213002)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-2.678324)*sailStates.alpha + (-0.028869)*sailStates.beta + (2.809483)*sailStates.p + (-14.285896)*sailStates.q + (-0.033561)*sailStates.r + (-0.000749)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end