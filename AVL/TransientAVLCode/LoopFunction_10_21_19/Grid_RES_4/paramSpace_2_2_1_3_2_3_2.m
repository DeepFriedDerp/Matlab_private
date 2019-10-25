function [aeroForces] = paramSpace_2_2_1_3_2_3_2(sailStates,airStates)

	CL = (4.175056)*sailStates.alpha + (0.016804)*sailStates.beta + (-2.549271)*sailStates.p + (34.213001)*sailStates.q + (0.305936)*sailStates.r + (0.010838)*sailStates.de;
	CD = -0.121610;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.210260)*sailStates.p + (-0.000000)*sailStates.q + (0.013781)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.316813)*sailStates.alpha + (-0.098432)*sailStates.beta + (-1.218793)*sailStates.p + (9.783506)*sailStates.q + (0.344784)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.887196)*sailStates.alpha + (-0.046194)*sailStates.beta + (8.896618)*sailStates.p + (-137.194580)*sailStates.q + (-1.005469)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.161158)*sailStates.alpha + (-0.007397)*sailStates.beta + (-0.558418)*sailStates.p + (2.909144)*sailStates.q + (-0.009012)*sailStates.r + (0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end