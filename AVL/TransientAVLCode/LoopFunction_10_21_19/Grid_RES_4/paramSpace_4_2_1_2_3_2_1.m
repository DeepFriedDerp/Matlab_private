function [aeroForces] = paramSpace_4_2_1_2_3_2_1(sailStates,airStates)

	CL = (3.844146)*sailStates.alpha + (0.042209)*sailStates.beta + (-2.115971)*sailStates.p + (31.782419)*sailStates.q + (0.624867)*sailStates.r + (0.010585)*sailStates.de;
	CD = 0.055760;
	CY = (0.125183)*sailStates.alpha + (-0.023962)*sailStates.beta + (0.032092)*sailStates.p + (1.057314)*sailStates.q + (-0.006497)*sailStates.r + (0.000223)*sailStates.de;

	Cl = (0.980129)*sailStates.alpha + (-0.045727)*sailStates.beta + (-0.875199)*sailStates.p + (6.999735)*sailStates.q + (0.359130)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-13.985341)*sailStates.alpha + (-0.127856)*sailStates.beta + (7.192851)*sailStates.p + (-125.069839)*sailStates.q + (-2.102463)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (-0.200084)*sailStates.alpha + (0.009676)*sailStates.beta + (0.017241)*sailStates.p + (-1.175120)*sailStates.q + (-0.040355)*sailStates.r + (-0.000289)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end