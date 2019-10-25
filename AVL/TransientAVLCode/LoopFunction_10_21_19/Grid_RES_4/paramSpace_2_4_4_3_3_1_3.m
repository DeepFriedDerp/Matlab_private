function [aeroForces] = paramSpace_2_4_4_3_3_1_3(sailStates,airStates)

	CL = (4.316248)*sailStates.alpha + (0.211396)*sailStates.beta + (-2.819779)*sailStates.p + (37.594872)*sailStates.q + (-1.134073)*sailStates.r + (0.011202)*sailStates.de;
	CD = -0.233830;
	CY = (0.022702)*sailStates.alpha + (-0.024364)*sailStates.beta + (-0.452075)*sailStates.p + (0.563442)*sailStates.q + (-0.029571)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.421327)*sailStates.alpha + (0.275228)*sailStates.beta + (-1.365037)*sailStates.p + (11.294272)*sailStates.q + (-0.932479)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.308959)*sailStates.alpha + (-0.719671)*sailStates.beta + (9.361761)*sailStates.p + (-143.062881)*sailStates.q + (3.803189)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.007506)*sailStates.alpha + (0.012171)*sailStates.beta + (0.936594)*sailStates.p + (-4.534366)*sailStates.q + (0.005792)*sailStates.r + (-0.000263)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end