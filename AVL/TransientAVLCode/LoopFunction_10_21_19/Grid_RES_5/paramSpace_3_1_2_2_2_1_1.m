function [aeroForces] = paramSpace_3_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.217405)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.320462)*sailStates.p + (35.277069)*sailStates.q + (-1.457040)*sailStates.r + (0.010948)*sailStates.de;
	CD = -0.159510;
	CY = (0.080046)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.497658)*sailStates.p + (0.261303)*sailStates.q + (-0.087760)*sailStates.r + (0.000055)*sailStates.de;

	Cl = (1.263172)*sailStates.alpha + (0.238406)*sailStates.beta + (-1.008961)*sailStates.p + (8.730027)*sailStates.q + (-1.144912)*sailStates.r + (0.000038)*sailStates.de;
	Cm = (-13.221461)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.195170)*sailStates.p + (-129.217163)*sailStates.q + (4.876095)*sailStates.r + (-0.067754)*sailStates.de;
	Cn = (-0.230434)*sailStates.alpha + (0.042037)*sailStates.beta + (0.970502)*sailStates.p + (-4.047715)*sailStates.q + (0.000595)*sailStates.r + (-0.000144)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end