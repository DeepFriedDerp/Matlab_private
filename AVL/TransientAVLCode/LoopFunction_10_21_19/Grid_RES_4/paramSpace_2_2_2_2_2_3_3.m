function [aeroForces] = paramSpace_2_2_2_2_2_3_3(sailStates,airStates)

	CL = (4.379560)*sailStates.alpha + (0.049306)*sailStates.beta + (-2.942390)*sailStates.p + (37.028324)*sailStates.q + (0.618150)*sailStates.r + (0.010982)*sailStates.de;
	CD = -0.398490;
	CY = (0.075327)*sailStates.alpha + (-0.025016)*sailStates.beta + (0.377378)*sailStates.p + (0.100924)*sailStates.q + (0.024731)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.502179)*sailStates.alpha + (-0.179720)*sailStates.beta + (-1.544522)*sailStates.p + (12.718934)*sailStates.q + (0.659131)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-14.802432)*sailStates.alpha + (-0.192708)*sailStates.beta + (10.321715)*sailStates.p + (-148.239975)*sailStates.q + (-2.086131)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.051010)*sailStates.alpha + (-0.013310)*sailStates.beta + (-0.946928)*sailStates.p + (4.613041)*sailStates.q + (-0.012239)*sailStates.r + (0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end