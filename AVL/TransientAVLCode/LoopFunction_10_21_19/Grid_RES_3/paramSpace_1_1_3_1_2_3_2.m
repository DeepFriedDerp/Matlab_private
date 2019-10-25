function [aeroForces] = paramSpace_1_1_3_1_2_3_2(sailStates,airStates)

	CL = (5.862026)*sailStates.alpha + (0.325735)*sailStates.beta + (-2.334679)*sailStates.p + (27.886168)*sailStates.q + (1.381568)*sailStates.r + (0.009313)*sailStates.de;
	CD = -2.078290;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.858610)*sailStates.p + (-0.000000)*sailStates.q + (0.151396)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.739572)*sailStates.alpha + (-0.346956)*sailStates.beta + (-1.161429)*sailStates.p + (8.484962)*sailStates.q + (1.509828)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-16.692255)*sailStates.alpha + (-1.356425)*sailStates.beta + (9.582350)*sailStates.p + (-134.612778)*sailStates.q + (-4.553990)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.547706)*sailStates.alpha + (-0.085368)*sailStates.beta + (-2.114836)*sailStates.p + (10.075133)*sailStates.q + (-0.070887)*sailStates.r + (0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end