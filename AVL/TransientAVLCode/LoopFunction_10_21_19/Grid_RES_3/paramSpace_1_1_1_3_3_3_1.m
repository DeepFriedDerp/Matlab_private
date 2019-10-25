function [aeroForces] = paramSpace_1_1_1_3_3_3_1(sailStates,airStates)

	CL = (3.850491)*sailStates.alpha + (-0.054798)*sailStates.beta + (-2.174580)*sailStates.p + (30.929974)*sailStates.q + (-0.262452)*sailStates.r + (0.009972)*sailStates.de;
	CD = -0.030030;
	CY = (0.034419)*sailStates.alpha + (-0.025711)*sailStates.beta + (0.037315)*sailStates.p + (0.318253)*sailStates.q + (0.006549)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.125760)*sailStates.alpha + (-0.044798)*sailStates.beta + (-0.979119)*sailStates.p + (7.850141)*sailStates.q + (-0.056260)*sailStates.r + (0.000085)*sailStates.de;
	Cm = (-14.180562)*sailStates.alpha + (0.233248)*sailStates.beta + (7.660896)*sailStates.p + (-126.937798)*sailStates.q + (0.935587)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (0.177072)*sailStates.alpha + (-0.008271)*sailStates.beta + (-0.253315)*sailStates.p + (1.508400)*sailStates.q + (-0.024283)*sailStates.r + (-0.000054)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end