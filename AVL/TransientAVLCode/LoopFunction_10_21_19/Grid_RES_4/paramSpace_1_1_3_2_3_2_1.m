function [aeroForces] = paramSpace_1_1_3_2_3_2_1(sailStates,airStates)

	CL = (3.875431)*sailStates.alpha + (-0.199544)*sailStates.beta + (-2.051818)*sailStates.p + (31.811567)*sailStates.q + (-1.012702)*sailStates.r + (0.010332)*sailStates.de;
	CD = 0.025400;
	CY = (0.107539)*sailStates.alpha + (-0.026188)*sailStates.beta + (-0.285218)*sailStates.p + (0.455227)*sailStates.q + (-0.056717)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (1.115580)*sailStates.alpha + (0.060529)*sailStates.beta + (-0.869664)*sailStates.p + (7.400856)*sailStates.q + (-0.701381)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-13.393852)*sailStates.alpha + (0.686698)*sailStates.beta + (6.603569)*sailStates.p + (-121.885399)*sailStates.q + (3.373660)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.177930)*sailStates.alpha + (0.024959)*sailStates.beta + (0.502972)*sailStates.p + (-2.193823)*sailStates.q + (-0.005116)*sailStates.r + (-0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end