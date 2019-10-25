function [aeroForces] = paramSpace_3_1_1_3_1_3_3(sailStates,airStates)

	CL = (4.316248)*sailStates.alpha + (0.211396)*sailStates.beta + (-2.819779)*sailStates.p + (37.594872)*sailStates.q + (1.134073)*sailStates.r + (0.011202)*sailStates.de;
	CD = -0.233830;
	CY = (-0.022702)*sailStates.alpha + (-0.025209)*sailStates.beta + (0.452075)*sailStates.p + (-0.563442)*sailStates.q + (-0.029571)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.557296)*sailStates.alpha + (-0.126912)*sailStates.beta + (-1.462741)*sailStates.p + (12.502831)*sailStates.q + (0.938755)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.308959)*sailStates.alpha + (-0.719672)*sailStates.beta + (9.361762)*sailStates.p + (-143.062866)*sailStates.q + (-3.803189)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (-0.069707)*sailStates.alpha + (0.014187)*sailStates.beta + (-0.930190)*sailStates.p + (4.455153)*sailStates.q + (0.005380)*sailStates.r + (0.000263)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end