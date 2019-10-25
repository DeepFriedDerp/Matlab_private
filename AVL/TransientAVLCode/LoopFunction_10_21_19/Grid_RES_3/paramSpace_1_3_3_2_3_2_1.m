function [aeroForces] = paramSpace_1_3_3_2_3_2_1(sailStates,airStates)

	CL = (3.944264)*sailStates.alpha + (0.144842)*sailStates.beta + (-2.075603)*sailStates.p + (31.765886)*sailStates.q + (-0.920329)*sailStates.r + (0.010522)*sailStates.de;
	CD = 0.017540;
	CY = (0.106616)*sailStates.alpha + (-0.023714)*sailStates.beta + (-0.256214)*sailStates.p + (0.491415)*sailStates.q + (-0.045131)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (0.972852)*sailStates.alpha + (0.156327)*sailStates.beta + (-0.791837)*sailStates.p + (6.263819)*sailStates.q + (-0.608499)*sailStates.r + (-0.000336)*sailStates.de;
	Cm = (-13.815969)*sailStates.alpha + (-0.452192)*sailStates.beta + (6.766611)*sailStates.p + (-122.751358)*sailStates.q + (3.057712)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.228134)*sailStates.alpha + (0.018161)*sailStates.beta + (0.472361)*sailStates.p + (-2.335314)*sailStates.q + (0.000319)*sailStates.r + (-0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end