function [aeroForces] = paramSpace_1_3_2_3_3_3_3(sailStates,airStates)

	CL = (3.908065)*sailStates.alpha + (0.052755)*sailStates.beta + (-2.681118)*sailStates.p + (35.133102)*sailStates.q + (-0.431829)*sailStates.r + (0.010317)*sailStates.de;
	CD = -0.044750;
	CY = (0.081414)*sailStates.alpha + (-0.023155)*sailStates.beta + (0.001215)*sailStates.p + (0.665001)*sailStates.q + (0.000214)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.225382)*sailStates.alpha + (-0.001356)*sailStates.beta + (-1.309597)*sailStates.p + (10.745800)*sailStates.q + (-0.157603)*sailStates.r + (0.000521)*sailStates.de;
	Cm = (-14.323583)*sailStates.alpha + (-0.150531)*sailStates.beta + (9.318570)*sailStates.p + (-141.044128)*sailStates.q + (1.473277)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.112450)*sailStates.alpha + (-0.001886)*sailStates.beta + (-0.225409)*sailStates.p + (1.245175)*sailStates.q + (-0.026818)*sailStates.r + (-0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end