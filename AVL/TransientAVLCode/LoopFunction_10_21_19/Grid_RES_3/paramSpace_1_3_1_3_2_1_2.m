function [aeroForces] = paramSpace_1_3_1_3_2_1_2(sailStates,airStates)

	CL = (4.130589)*sailStates.alpha + (0.323249)*sailStates.beta + (-2.529558)*sailStates.p + (37.134914)*sailStates.q + (-1.545238)*sailStates.r + (0.010911)*sailStates.de;
	CD = -0.180410;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.520602)*sailStates.p + (-0.000001)*sailStates.q + (-0.091796)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.232733)*sailStates.alpha + (0.346349)*sailStates.beta + (-1.138129)*sailStates.p + (9.840816)*sailStates.q + (-1.236781)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-12.734461)*sailStates.alpha + (-1.267122)*sailStates.beta + (7.863721)*sailStates.p + (-134.612778)*sailStates.q + (5.192839)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.037190)*sailStates.alpha + (0.045198)*sailStates.beta + (0.998642)*sailStates.p + (-3.817825)*sailStates.q + (-0.006843)*sailStates.r + (-0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end