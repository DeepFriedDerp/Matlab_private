function [aeroForces] = paramSpace_1_1_1_1_2_3_2(sailStates,airStates)

	CL = (5.696413)*sailStates.alpha + (0.277948)*sailStates.beta + (-2.333083)*sailStates.p + (28.001358)*sailStates.q + (1.359426)*sailStates.r + (0.009105)*sailStates.de;
	CD = -1.975900;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.819948)*sailStates.p + (0.000000)*sailStates.q + (0.144579)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.733187)*sailStates.alpha + (-0.329497)*sailStates.beta + (-1.160571)*sailStates.p + (8.490235)*sailStates.q + (1.447116)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-16.216513)*sailStates.alpha + (-1.041064)*sailStates.beta + (9.559310)*sailStates.p + (-134.612778)*sailStates.q + (-4.423325)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.551715)*sailStates.alpha + (-0.082558)*sailStates.beta + (-2.056871)*sailStates.p + (10.045230)*sailStates.q + (-0.071557)*sailStates.r + (0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end