function [aeroForces] = paramSpace_1_2_3_1_2_2_1(sailStates,airStates)

	CL = (3.680881)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.643497)*sailStates.p + (27.943295)*sailStates.q + (-0.564949)*sailStates.r + (0.010465)*sailStates.de;
	CD = 0.039630;
	CY = (-0.041633)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.085107)*sailStates.p + (-0.589408)*sailStates.q + (-0.015063)*sailStates.r + (-0.000124)*sailStates.de;

	Cl = (0.577987)*sailStates.alpha + (0.066070)*sailStates.beta + (-0.470052)*sailStates.p + (3.155519)*sailStates.q + (-0.323666)*sailStates.r + (-0.000783)*sailStates.de;
	Cm = (-13.292144)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.526708)*sailStates.p + (-111.551048)*sailStates.q + (1.891485)*sailStates.r + (-0.066175)*sailStates.de;
	Cn = (-0.091469)*sailStates.alpha + (0.011650)*sailStates.beta + (0.173971)*sailStates.p + (-0.438747)*sailStates.q + (-0.011919)*sailStates.r + (0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end