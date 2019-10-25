function [aeroForces] = paramSpace_1_2_2_3_3_1_1(sailStates,airStates)

	CL = (4.295794)*sailStates.alpha + (-0.124733)*sailStates.beta + (-2.264616)*sailStates.p + (35.579311)*sailStates.q + (-1.676258)*sailStates.r + (0.010929)*sailStates.de;
	CD = -0.248960;
	CY = (0.104530)*sailStates.alpha + (-0.025300)*sailStates.beta + (-0.578781)*sailStates.p + (0.294837)*sailStates.q + (-0.115137)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.310712)*sailStates.alpha + (0.241887)*sailStates.beta + (-0.979718)*sailStates.p + (8.765203)*sailStates.q + (-1.325723)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-12.702786)*sailStates.alpha + (0.469301)*sailStates.beta + (6.757295)*sailStates.p + (-127.124184)*sailStates.q + (5.580485)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (-0.308239)*sailStates.alpha + (0.055965)*sailStates.beta + (1.146184)*sailStates.p + (-4.801703)*sailStates.q + (0.003030)*sailStates.r + (-0.000165)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end