function [aeroForces] = paramSpace_2_2_1_1_2_2_1(sailStates,airStates)

	CL = (5.529274)*sailStates.alpha + (-3.973699)*sailStates.beta + (-3.505020)*sailStates.p + (48.120739)*sailStates.q + (2.283173)*sailStates.r + (0.010605)*sailStates.de;
	CD = -6.526980;
	CY = (1.854557)*sailStates.alpha + (-0.256365)*sailStates.beta + (0.319867)*sailStates.p + (16.088501)*sailStates.q + (-0.032995)*sailStates.r + (0.003066)*sailStates.de;

	Cl = (-5.891900)*sailStates.alpha + (-1.282200)*sailStates.beta + (-1.709141)*sailStates.p + (14.569105)*sailStates.q + (2.527793)*sailStates.r + (0.001286)*sailStates.de;
	Cm = (6.661516)*sailStates.alpha + (17.845352)*sailStates.beta + (10.868543)*sailStates.p + (-152.825745)*sailStates.q + (-8.080809)*sailStates.r + (-0.055441)*sailStates.de;
	Cn = (-1.951574)*sailStates.alpha + (0.361431)*sailStates.beta + (-0.944818)*sailStates.p + (-9.007144)*sailStates.q + (-0.201001)*sailStates.r + (-0.003998)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end