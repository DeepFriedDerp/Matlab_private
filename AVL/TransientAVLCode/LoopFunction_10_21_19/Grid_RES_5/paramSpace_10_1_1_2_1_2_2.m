function [aeroForces] = paramSpace_10_1_1_2_1_2_2(sailStates,airStates)

	CL = (4.293596)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.792469)*sailStates.p + (37.425079)*sailStates.q + (1.016132)*sailStates.r + (0.011347)*sailStates.de;
	CD = -0.150710;
	CY = (-0.025160)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.387162)*sailStates.p + (-0.466417)*sailStates.q + (-0.027024)*sailStates.r + (-0.000101)*sailStates.de;

	Cl = (1.451410)*sailStates.alpha + (-0.174733)*sailStates.beta + (-1.385352)*sailStates.p + (11.608013)*sailStates.q + (0.821975)*sailStates.r + (0.000618)*sailStates.de;
	Cm = (-14.568334)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.296666)*sailStates.p + (-142.955811)*sailStates.q + (-3.403479)*sailStates.r + (-0.070744)*sailStates.de;
	Cn = (-0.017441)*sailStates.alpha + (0.012219)*sailStates.beta + (-0.787651)*sailStates.p + (3.752120)*sailStates.q + (0.004039)*sailStates.r + (0.000224)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end