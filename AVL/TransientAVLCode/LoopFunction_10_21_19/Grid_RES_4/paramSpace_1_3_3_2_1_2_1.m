function [aeroForces] = paramSpace_1_3_3_2_1_2_1(sailStates,airStates)

	CL = (3.809613)*sailStates.alpha + (0.049181)*sailStates.beta + (-2.115338)*sailStates.p + (31.830732)*sailStates.q + (-0.632919)*sailStates.r + (0.010498)*sailStates.de;
	CD = 0.061520;
	CY = (-0.122688)*sailStates.alpha + (-0.026064)*sailStates.beta + (-0.046476)*sailStates.p + (-1.057313)*sailStates.q + (-0.009283)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (0.923898)*sailStates.alpha + (0.077118)*sailStates.beta + (-0.843331)*sailStates.p + (6.605009)*sailStates.q + (-0.376094)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-13.779564)*sailStates.alpha + (-0.171866)*sailStates.beta + (7.183815)*sailStates.p + (-125.069839)*sailStates.q + (2.147887)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.177449)*sailStates.alpha + (0.014836)*sailStates.beta + (0.010661)*sailStates.p + (1.084890)*sailStates.q + (-0.039300)*sailStates.r + (0.000296)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end