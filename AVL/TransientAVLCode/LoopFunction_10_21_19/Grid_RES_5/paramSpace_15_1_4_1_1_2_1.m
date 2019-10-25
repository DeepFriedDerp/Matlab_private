function [aeroForces] = paramSpace_15_1_4_1_1_2_1(sailStates,airStates)

	CL = (5.129667)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.034921)*sailStates.p + (37.236767)*sailStates.q + (2.535069)*sailStates.r + (0.011125)*sailStates.de;
	CD = -1.012340;
	CY = (-0.284555)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.956925)*sailStates.p + (-0.476205)*sailStates.q + (-0.238640)*sailStates.r + (-0.000099)*sailStates.de;

	Cl = (1.578618)*sailStates.alpha + (-0.459753)*sailStates.beta + (-0.757823)*sailStates.p + (7.655639)*sailStates.q + (2.076861)*sailStates.r + (-0.000383)*sailStates.de;
	Cm = (-10.451403)*sailStates.alpha + (0.000000)*sailStates.beta + (4.834974)*sailStates.p + (-118.206032)*sailStates.q + (-8.308998)*sailStates.r + (-0.064943)*sailStates.de;
	Cn = (1.043068)*sailStates.alpha + (0.114629)*sailStates.beta + (-2.031383)*sailStates.p + (8.916201)*sailStates.q + (0.035527)*sailStates.r + (0.000262)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end