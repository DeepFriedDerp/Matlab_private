function [aeroForces] = paramSpace_9_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.421652)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.065790)*sailStates.p + (38.318367)*sailStates.q + (-0.805105)*sailStates.r + (0.011181)*sailStates.de;
	CD = -0.539960;
	CY = (-0.211345)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.388970)*sailStates.p + (-1.046667)*sailStates.q + (0.013546)*sailStates.r + (-0.000228)*sailStates.de;

	Cl = (1.378631)*sailStates.alpha + (0.236854)*sailStates.beta + (-1.622409)*sailStates.p + (13.445062)*sailStates.q + (-0.825798)*sailStates.r + (0.001016)*sailStates.de;
	Cm = (-14.299485)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.623125)*sailStates.p + (-151.326889)*sailStates.q + (2.740971)*sailStates.r + (-0.071886)*sailStates.de;
	Cn = (0.286183)*sailStates.alpha + (-0.008271)*sailStates.beta + (0.962152)*sailStates.p + (-3.844721)*sailStates.q + (-0.002741)*sailStates.r + (0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end