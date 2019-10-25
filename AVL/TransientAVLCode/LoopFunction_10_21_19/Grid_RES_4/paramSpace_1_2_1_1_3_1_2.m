function [aeroForces] = paramSpace_1_2_1_1_3_1_2(sailStates,airStates)

	CL = (7.806341)*sailStates.alpha + (-0.273877)*sailStates.beta + (-2.599939)*sailStates.p + (43.561172)*sailStates.q + (-3.677380)*sailStates.r + (0.012064)*sailStates.de;
	CD = -3.077060;
	CY = (0.259102)*sailStates.alpha + (-0.026920)*sailStates.beta + (-1.539836)*sailStates.p + (1.664521)*sailStates.q + (-0.306471)*sailStates.r + (0.000352)*sailStates.de;

	Cl = (3.066902)*sailStates.alpha + (0.622932)*sailStates.beta + (-1.201543)*sailStates.p + (12.289609)*sailStates.q + (-3.153908)*sailStates.r + (0.000263)*sailStates.de;
	Cm = (-11.964672)*sailStates.alpha + (1.046862)*sailStates.beta + (6.114639)*sailStates.p + (-132.472137)*sailStates.q + (12.165198)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.391471)*sailStates.alpha + (0.144912)*sailStates.beta + (3.244163)*sailStates.p + (-14.973935)*sailStates.q + (0.065392)*sailStates.r + (-0.000716)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end