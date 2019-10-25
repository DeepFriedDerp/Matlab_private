function [aeroForces] = paramSpace_3_3_4_3_2_1_2(sailStates,airStates)

	CL = (4.175056)*sailStates.alpha + (0.016804)*sailStates.beta + (-2.549271)*sailStates.p + (34.213001)*sailStates.q + (-0.305936)*sailStates.r + (0.010838)*sailStates.de;
	CD = -0.121610;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.210260)*sailStates.p + (0.000000)*sailStates.q + (0.013781)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.265956)*sailStates.alpha + (0.111814)*sailStates.beta + (-1.186148)*sailStates.p + (9.379635)*sailStates.q + (-0.346966)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-14.887196)*sailStates.alpha + (-0.046194)*sailStates.beta + (8.896618)*sailStates.p + (-137.194580)*sailStates.q + (1.005469)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.167035)*sailStates.alpha + (-0.006383)*sailStates.beta + (0.556278)*sailStates.p + (-2.882673)*sailStates.q + (-0.008869)*sailStates.r + (-0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end