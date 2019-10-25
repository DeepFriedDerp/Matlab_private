function [aeroForces] = paramSpace_1_1_3_3_1_2_2(sailStates,airStates)

	CL = (3.878536)*sailStates.alpha + (-0.121831)*sailStates.beta + (-2.499624)*sailStates.p + (34.874374)*sailStates.q + (-0.736709)*sailStates.r + (0.010712)*sailStates.de;
	CD = 0.056980;
	CY = (-0.061227)*sailStates.alpha + (-0.023714)*sailStates.beta + (-0.099185)*sailStates.p + (-0.491627)*sailStates.q + (-0.017536)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.238043)*sailStates.alpha + (0.025384)*sailStates.beta + (-1.217556)*sailStates.p + (10.326230)*sailStates.q + (-0.472786)*sailStates.r + (0.000474)*sailStates.de;
	Cm = (-14.026400)*sailStates.alpha + (0.375802)*sailStates.beta + (8.421549)*sailStates.p + (-135.234573)*sailStates.q + (2.467368)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.204706)*sailStates.alpha + (0.008232)*sailStates.beta + (0.071065)*sailStates.p + (0.618582)*sailStates.q + (-0.033139)*sailStates.r + (0.000116)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end