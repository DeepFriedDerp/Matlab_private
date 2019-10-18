function [aeroForces] = paramSpace_2_1_1_2_2_1_1(sailStates,airStates)

	CL = (5.982178)*sailStates.alpha + (-1.940699)*sailStates.beta + (-3.692530)*sailStates.p + (50.762897)*sailStates.q + (2.320012)*sailStates.r + (0.012847)*sailStates.de;
	CD = -5.953880;
	CY = (1.947391)*sailStates.alpha + (-0.119028)*sailStates.beta + (0.342578)*sailStates.p + (15.052655)*sailStates.q + (-0.039771)*sailStates.r + (0.003187)*sailStates.de;

	Cl = (-4.933709)*sailStates.alpha + (-1.059768)*sailStates.beta + (-1.873614)*sailStates.p + (16.274424)*sailStates.q + (2.498223)*sailStates.r + (0.001610)*sailStates.de;
	Cm = (3.027597)*sailStates.alpha + (8.511157)*sailStates.beta + (11.511370)*sailStates.p + (-164.558411)*sailStates.q + (-8.126306)*sailStates.r + (-0.068241)*sailStates.de;
	Cn = (-2.241061)*sailStates.alpha + (0.202161)*sailStates.beta + (-0.968661)*sailStates.p + (-8.045554)*sailStates.q + (-0.180766)*sailStates.r + (-0.004121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end