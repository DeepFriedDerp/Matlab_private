function [aeroForces] = paramSpace_3_1_2_1_2_1_1(sailStates,airStates)

	CL = (5.876638)*sailStates.alpha + (-0.475307)*sailStates.beta + (-1.604524)*sailStates.p + (24.867754)*sailStates.q + (-2.010798)*sailStates.r + (0.009974)*sailStates.de;
	CD = -2.240510;
	CY = (0.399900)*sailStates.alpha + (-0.024573)*sailStates.beta + (-1.018152)*sailStates.p + (0.221995)*sailStates.q + (0.066725)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.237264)*sailStates.alpha + (0.362112)*sailStates.beta + (-0.506691)*sailStates.p + (2.907524)*sailStates.q + (-1.955217)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-14.738196)*sailStates.alpha + (1.902818)*sailStates.beta + (6.231594)*sailStates.p + (-111.854546)*sailStates.q + (6.819656)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-1.967472)*sailStates.alpha + (-0.036089)*sailStates.beta + (2.296881)*sailStates.p + (-10.585889)*sailStates.q + (-0.020268)*sailStates.r + (-0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end