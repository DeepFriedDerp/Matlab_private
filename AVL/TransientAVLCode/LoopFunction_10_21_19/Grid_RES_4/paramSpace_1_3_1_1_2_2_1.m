function [aeroForces] = paramSpace_1_3_1_1_2_2_1(sailStates,airStates)

	CL = (3.529421)*sailStates.alpha + (0.063076)*sailStates.beta + (-1.627244)*sailStates.p + (28.089273)*sailStates.q + (-0.654150)*sailStates.r + (0.010121)*sailStates.de;
	CD = 0.078780;
	CY = (-0.030362)*sailStates.alpha + (-0.025749)*sailStates.beta + (-0.137822)*sailStates.p + (-0.662188)*sailStates.q + (-0.027343)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (0.541666)*sailStates.alpha + (0.105133)*sailStates.beta + (-0.447380)*sailStates.p + (2.974689)*sailStates.q + (-0.427516)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-12.505998)*sailStates.alpha + (-0.259974)*sailStates.beta + (5.407299)*sailStates.p + (-110.966957)*sailStates.q + (2.234737)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (-0.159269)*sailStates.alpha + (0.019509)*sailStates.beta + (0.263389)*sailStates.p + (-0.563963)*sailStates.q + (-0.015312)*sailStates.r + (0.000185)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end