function [aeroForces] = paramSpace_3_3_1_2_2_2_1(sailStates,airStates)

	CL = (4.013018)*sailStates.alpha + (-0.010072)*sailStates.beta + (-2.164772)*sailStates.p + (31.685673)*sailStates.q + (0.268526)*sailStates.r + (0.010899)*sailStates.de;
	CD = 0.030620;
	CY = (0.006437)*sailStates.alpha + (-0.025002)*sailStates.beta + (0.036998)*sailStates.p + (0.100923)*sailStates.q + (-0.002436)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (0.995751)*sailStates.alpha + (-0.027971)*sailStates.beta + (-0.863319)*sailStates.p + (6.534647)*sailStates.q + (0.149107)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-14.627804)*sailStates.alpha + (0.007960)*sailStates.beta + (7.418530)*sailStates.p + (-126.149185)*sailStates.q + (-0.883665)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (-0.003929)*sailStates.alpha + (0.001574)*sailStates.beta + (-0.058009)*sailStates.p + (0.201058)*sailStates.q + (-0.002523)*sailStates.r + (-0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end