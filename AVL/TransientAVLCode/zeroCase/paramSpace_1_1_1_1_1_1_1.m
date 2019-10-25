function [aeroForces] = paramSpace_1_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.089139)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.580122)*sailStates.p + (34.962635)*sailStates.q + (0.000000)*sailStates.r + (0.011114)*sailStates.de;
	CD = 0.025000;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.000000)*sailStates.p + (0.000000)*sailStates.q + (0.000000)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.264913)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.214921)*sailStates.p + (9.780688)*sailStates.q + (0.000000)*sailStates.r + (0.000346)*sailStates.de;
	Cm = (-14.846089)*sailStates.alpha + (0.000000)*sailStates.beta + (8.839129)*sailStates.p + (-137.619934)*sailStates.q + (-0.000000)*sailStates.r + (-0.070499)*sailStates.de;
	Cn = (-0.000000)*sailStates.alpha + (0.000000)*sailStates.beta + (0.000000)*sailStates.p + (-0.000000)*sailStates.q + (-0.000000)*sailStates.r + (-0.000000)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end