function [aeroForces] = paramSpace_4_3_4_1_1_1_3(sailStates,airStates)

	CL = (4.716585)*sailStates.alpha + (0.060264)*sailStates.beta + (-3.111964)*sailStates.p + (34.962700)*sailStates.q + (-0.482574)*sailStates.r + (0.009346)*sailStates.de;
	CD = -1.397030;
	CY = (-0.421783)*sailStates.alpha + (-0.022260)*sailStates.beta + (-0.418650)*sailStates.p + (-2.326708)*sailStates.q + (0.083025)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (1.282711)*sailStates.alpha + (0.308456)*sailStates.beta + (-1.761876)*sailStates.p + (14.441138)*sailStates.q + (-0.747536)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-14.089976)*sailStates.alpha + (-0.234335)*sailStates.beta + (11.809351)*sailStates.p + (-156.352325)*sailStates.q + (1.488129)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (0.532122)*sailStates.alpha + (-0.057745)*sailStates.beta + (1.364972)*sailStates.p + (-5.830847)*sailStates.q + (-0.052913)*sailStates.r + (0.000506)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end