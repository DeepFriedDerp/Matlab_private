function [aeroForces] = paramSpace_1_3_1_1_2_3_2(sailStates,airStates)

	CL = (5.696413)*sailStates.alpha + (-0.277948)*sailStates.beta + (-2.333084)*sailStates.p + (28.001358)*sailStates.q + (1.359426)*sailStates.r + (0.009105)*sailStates.de;
	CD = -1.975900;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.819948)*sailStates.p + (0.000000)*sailStates.q + (0.144579)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.587111)*sailStates.alpha + (-0.487842)*sailStates.beta + (-1.075953)*sailStates.p + (7.429369)*sailStates.q + (1.462138)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-16.216513)*sailStates.alpha + (1.041064)*sailStates.beta + (9.559311)*sailStates.p + (-134.612778)*sailStates.q + (-4.423325)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.624108)*sailStates.alpha + (-0.061561)*sailStates.beta + (-2.041950)*sailStates.p + (9.858171)*sailStates.q + (-0.068908)*sailStates.r + (0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end