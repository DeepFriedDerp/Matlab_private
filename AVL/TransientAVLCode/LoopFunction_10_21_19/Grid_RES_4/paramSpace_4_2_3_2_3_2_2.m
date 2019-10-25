function [aeroForces] = paramSpace_4_2_3_2_3_2_2(sailStates,airStates)

	CL = (3.798395)*sailStates.alpha + (0.063232)*sailStates.beta + (-2.502106)*sailStates.p + (35.181850)*sailStates.q + (0.797069)*sailStates.r + (0.010595)*sailStates.de;
	CD = 0.083950;
	CY = (0.094289)*sailStates.alpha + (-0.024146)*sailStates.beta + (0.108749)*sailStates.p + (0.756269)*sailStates.q + (-0.021604)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.176719)*sailStates.alpha + (-0.066927)*sailStates.beta + (-1.192567)*sailStates.p + (10.067000)*sailStates.q + (0.533327)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-13.638755)*sailStates.alpha + (-0.240115)*sailStates.beta + (8.425582)*sailStates.p + (-135.926239)*sailStates.q + (-2.713488)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.252770)*sailStates.alpha + (0.014523)*sailStates.beta + (-0.062702)*sailStates.p + (-1.073769)*sailStates.q + (-0.046496)*sailStates.r + (-0.000213)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end