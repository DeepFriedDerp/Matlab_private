function [aeroForces] = paramSpace_1_2_1_1_3_3_3(sailStates,airStates)

	CL = (4.716586)*sailStates.alpha + (0.060264)*sailStates.beta + (-3.111964)*sailStates.p + (34.962692)*sailStates.q + (0.482575)*sailStates.r + (0.009346)*sailStates.de;
	CD = -1.397030;
	CY = (0.421783)*sailStates.alpha + (-0.027693)*sailStates.beta + (0.418650)*sailStates.p + (2.326708)*sailStates.q + (0.083025)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (1.325993)*sailStates.alpha + (-0.294901)*sailStates.beta + (-1.793408)*sailStates.p + (14.838102)*sailStates.q + (0.741221)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-14.089977)*sailStates.alpha + (-0.234335)*sailStates.beta + (11.809352)*sailStates.p + (-156.352325)*sailStates.q + (-1.488128)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-0.550877)*sailStates.alpha + (-0.062270)*sailStates.beta + (-1.371244)*sailStates.p + (5.909808)*sailStates.q + (-0.054169)*sailStates.r + (-0.000506)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end