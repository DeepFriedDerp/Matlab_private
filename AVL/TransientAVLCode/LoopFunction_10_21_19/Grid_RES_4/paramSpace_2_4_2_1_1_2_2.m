function [aeroForces] = paramSpace_2_4_2_1_1_2_2(sailStates,airStates)

	CL = (4.065622)*sailStates.alpha + (0.018519)*sailStates.beta + (-2.564047)*sailStates.p + (34.617596)*sailStates.q + (0.107002)*sailStates.r + (0.010861)*sailStates.de;
	CD = -0.009340;
	CY = (-0.206997)*sailStates.alpha + (-0.026772)*sailStates.beta + (0.191320)*sailStates.p + (-1.693497)*sailStates.q + (0.012599)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (1.224175)*sailStates.alpha + (-0.034832)*sailStates.beta + (-1.160546)*sailStates.p + (9.078634)*sailStates.q + (0.125722)*sailStates.r + (0.000247)*sailStates.de;
	Cm = (-14.699849)*sailStates.alpha + (-0.109693)*sailStates.beta + (8.882741)*sailStates.p + (-136.946671)*sailStates.q + (-0.329692)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.318439)*sailStates.alpha + (0.001250)*sailStates.beta + (-0.447041)*sailStates.p + (3.526788)*sailStates.q + (-0.016192)*sailStates.r + (0.000523)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end