function [aeroForces] = paramSpace_4_4_3_1_2_2_1(sailStates,airStates)

	CL = (3.515783)*sailStates.alpha + (-0.167149)*sailStates.beta + (-1.608825)*sailStates.p + (27.772701)*sailStates.q + (0.639523)*sailStates.r + (0.010049)*sailStates.de;
	CD = 0.059910;
	CY = (0.035803)*sailStates.alpha + (-0.026962)*sailStates.beta + (0.121836)*sailStates.p + (0.662188)*sailStates.q + (-0.024211)*sailStates.r + (0.000137)*sailStates.de;

	Cl = (0.467646)*sailStates.alpha + (-0.115170)*sailStates.beta + (-0.407367)*sailStates.p + (2.501564)*sailStates.q + (0.393340)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-12.500335)*sailStates.alpha + (0.641488)*sailStates.beta + (5.353188)*sailStates.p + (-109.940704)*sailStates.q + (-2.168899)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (0.162349)*sailStates.alpha + (0.018615)*sailStates.beta + (-0.245713)*sailStates.p + (0.626014)*sailStates.q + (-0.013309)*sailStates.r + (-0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end