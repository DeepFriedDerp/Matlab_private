function [aeroForces] = paramSpace_3_2_3_1_3_2_2(sailStates,airStates)

	CL = (4.126567)*sailStates.alpha + (0.006393)*sailStates.beta + (-2.583580)*sailStates.p + (34.883789)*sailStates.q + (-0.104430)*sailStates.r + (0.011029)*sailStates.de;
	CD = -0.009100;
	CY = (0.208610)*sailStates.alpha + (-0.024313)*sailStates.beta + (-0.190688)*sailStates.p + (1.693497)*sailStates.q + (0.012558)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.342143)*sailStates.alpha + (0.024620)*sailStates.beta + (-1.234910)*sailStates.p + (9.959337)*sailStates.q + (-0.119590)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-14.922051)*sailStates.alpha + (-0.037475)*sailStates.beta + (8.949369)*sailStates.p + (-137.990799)*sailStates.q + (0.320897)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (-0.323003)*sailStates.alpha + (-0.002792)*sailStates.beta + (0.450453)*sailStates.p + (-3.577820)*sailStates.q + (-0.016498)*sailStates.r + (-0.000527)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end