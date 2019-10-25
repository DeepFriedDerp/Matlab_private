function [aeroForces] = paramSpace_1_3_1_3_3_1_1(sailStates,airStates)

	CL = (4.258687)*sailStates.alpha + (0.131564)*sailStates.beta + (-2.263989)*sailStates.p + (35.627689)*sailStates.q + (-1.684296)*sailStates.r + (0.010842)*sailStates.de;
	CD = -0.238850;
	CY = (0.106140)*sailStates.alpha + (-0.024632)*sailStates.beta + (-0.593167)*sailStates.p + (0.294835)*sailStates.q + (-0.118020)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.265576)*sailStates.alpha + (0.319788)*sailStates.beta + (-0.947867)*sailStates.p + (8.370474)*sailStates.q + (-1.342630)*sailStates.r + (-0.000073)*sailStates.de;
	Cm = (-12.503475)*sailStates.alpha + (-0.513377)*sailStates.beta + (6.748115)*sailStates.p + (-127.124184)*sailStates.q + (5.626636)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (-0.346572)*sailStates.alpha + (0.055701)*sailStates.beta + (1.174183)*sailStates.p + (-4.891915)*sailStates.q + (0.003748)*sailStates.r + (-0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end