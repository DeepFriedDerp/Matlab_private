function [aeroForces] = paramSpace_4_3_3_1_3_3_3(sailStates,airStates)

	CL = (5.062512)*sailStates.alpha + (-0.243056)*sailStates.beta + (-3.550962)*sailStates.p + (50.229366)*sailStates.q + (3.160363)*sailStates.r + (0.012650)*sailStates.de;
	CD = -1.877350;
	CY = (0.565701)*sailStates.alpha + (-0.026077)*sailStates.beta + (1.101791)*sailStates.p + (1.002334)*sailStates.q + (-0.219124)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (1.123896)*sailStates.alpha + (-0.662116)*sailStates.beta + (-1.930989)*sailStates.p + (18.453966)*sailStates.q + (2.705809)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (-8.429821)*sailStates.alpha + (0.925499)*sailStates.beta + (10.015306)*sailStates.p + (-161.102386)*sailStates.q + (-10.510052)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-1.809759)*sailStates.alpha + (0.117987)*sailStates.beta + (-2.193274)*sailStates.p + (7.640448)*sailStates.q + (-0.025664)*sailStates.r + (-0.000058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end