function [aeroForces] = paramSpace_1_2_1_3_2_1_2(sailStates,airStates)

	CL = (4.183556)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.546475)*sailStates.p + (37.373596)*sailStates.q + (-1.551269)*sailStates.r + (0.011058)*sailStates.de;
	CD = -0.180110;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.522075)*sailStates.p + (-0.000000)*sailStates.q + (-0.092056)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.308717)*sailStates.alpha + (0.261038)*sailStates.beta + (-1.188379)*sailStates.p + (10.438128)*sailStates.q + (-1.248591)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-12.913855)*sailStates.alpha + (0.000000)*sailStates.beta + (7.919877)*sailStates.p + (-135.529190)*sailStates.q + (5.213330)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.005122)*sailStates.alpha + (0.046028)*sailStates.beta + (0.993231)*sailStates.p + (-3.728518)*sailStates.q + (-0.008318)*sailStates.r + (-0.000068)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end