function [aeroForces] = paramSpace_1_3_1_1_2_2_3(sailStates,airStates)

	CL = (3.456276)*sailStates.alpha + (0.094987)*sailStates.beta + (-3.330968)*sailStates.p + (42.620747)*sailStates.q + (-1.343913)*sailStates.r + (0.010950)*sailStates.de;
	CD = 0.114970;
	CY = (-0.046863)*sailStates.alpha + (-0.024203)*sailStates.beta + (-0.348936)*sailStates.p + (0.662188)*sailStates.q + (-0.069479)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.297795)*sailStates.alpha + (0.180800)*sailStates.beta + (-1.846221)*sailStates.p + (16.448637)*sailStates.q + (-0.991253)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-12.256315)*sailStates.alpha + (-0.368176)*sailStates.beta + (10.906545)*sailStates.p + (-158.727356)*sailStates.q + (4.540052)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (0.538872)*sailStates.alpha + (0.030931)*sailStates.beta + (0.425289)*sailStates.p + (-0.910289)*sailStates.q + (-0.039706)*sailStates.r + (-0.000213)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end