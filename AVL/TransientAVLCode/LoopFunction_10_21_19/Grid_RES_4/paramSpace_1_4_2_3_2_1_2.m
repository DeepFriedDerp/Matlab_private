function [aeroForces] = paramSpace_1_4_2_3_2_1_2(sailStates,airStates)

	CL = (4.111545)*sailStates.alpha + (0.368100)*sailStates.beta + (-2.510833)*sailStates.p + (37.366966)*sailStates.q + (-1.644461)*sailStates.r + (0.010889)*sailStates.de;
	CD = -0.183750;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.530227)*sailStates.p + (-0.000000)*sailStates.q + (-0.105469)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.215297)*sailStates.alpha + (0.367578)*sailStates.beta + (-1.122663)*sailStates.p + (9.853553)*sailStates.q + (-1.287734)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-12.496474)*sailStates.alpha + (-1.387716)*sailStates.beta + (7.672079)*sailStates.p + (-133.820877)*sailStates.q + (5.486995)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.031327)*sailStates.alpha + (0.052027)*sailStates.beta + (1.015854)*sailStates.p + (-3.891062)*sailStates.q + (-0.009698)*sailStates.r + (-0.000077)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end