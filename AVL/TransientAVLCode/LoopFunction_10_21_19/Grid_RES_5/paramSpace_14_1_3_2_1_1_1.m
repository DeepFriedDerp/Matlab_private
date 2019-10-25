function [aeroForces] = paramSpace_14_1_3_2_1_1_1(sailStates,airStates)

	CL = (3.840663)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.207774)*sailStates.p + (31.656130)*sailStates.q + (0.523706)*sailStates.r + (0.010044)*sailStates.de;
	CD = 0.013890;
	CY = (-0.031150)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.030839)*sailStates.p + (-0.230434)*sailStates.q + (-0.006563)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.081702)*sailStates.alpha + (-0.006291)*sailStates.beta + (-0.967146)*sailStates.p + (7.787787)*sailStates.q + (0.240208)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-14.155431)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.659165)*sailStates.p + (-128.239044)*sailStates.q + (-1.800704)*sailStates.r + (-0.066831)*sailStates.de;
	Cn = (-0.146783)*sailStates.alpha + (0.001337)*sailStates.beta + (0.112487)*sailStates.p + (-0.937052)*sailStates.q + (-0.031278)*sailStates.r + (0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end