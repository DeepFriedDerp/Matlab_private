function [aeroForces] = paramSpace_1_1_2_1_2_3_2(sailStates,airStates)

	CL = (5.784748)*sailStates.alpha + (0.301598)*sailStates.beta + (-2.333866)*sailStates.p + (27.943756)*sailStates.q + (1.370407)*sailStates.r + (0.009209)*sailStates.de;
	CD = -2.032990;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.839279)*sailStates.p + (0.000001)*sailStates.q + (0.147987)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.736498)*sailStates.alpha + (-0.338231)*sailStates.beta + (-1.160993)*sailStates.p + (8.487598)*sailStates.q + (1.478436)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-16.454384)*sailStates.alpha + (-1.198744)*sailStates.beta + (9.570830)*sailStates.p + (-134.612778)*sailStates.q + (-4.488660)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.549777)*sailStates.alpha + (-0.083933)*sailStates.beta + (-2.085890)*sailStates.p + (10.060183)*sailStates.q + (-0.071014)*sailStates.r + (0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end