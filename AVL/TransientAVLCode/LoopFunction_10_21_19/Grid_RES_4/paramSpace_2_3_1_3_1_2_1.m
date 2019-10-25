function [aeroForces] = paramSpace_2_3_1_3_1_2_1(sailStates,airStates)

	CL = (4.003464)*sailStates.alpha + (0.026418)*sailStates.beta + (-2.311109)*sailStates.p + (32.857849)*sailStates.q + (-0.181742)*sailStates.r + (0.010874)*sailStates.de;
	CD = 0.042780;
	CY = (-0.069392)*sailStates.alpha + (-0.025237)*sailStates.beta + (-0.006879)*sailStates.p + (-0.563442)*sailStates.q + (-0.000391)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.084404)*sailStates.alpha + (0.029552)*sailStates.beta + (-0.982083)*sailStates.p + (7.604414)*sailStates.q + (-0.129012)*sailStates.r + (-0.000030)*sailStates.de;
	Cm = (-14.562799)*sailStates.alpha + (-0.127050)*sailStates.beta + (7.940338)*sailStates.p + (-130.282166)*sailStates.q + (0.653788)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (0.115517)*sailStates.alpha + (0.002155)*sailStates.beta + (-0.037197)*sailStates.p + (0.873014)*sailStates.q + (-0.007033)*sailStates.r + (0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end