function [aeroForces] = paramSpace_1_4_3_3_3_1_1(sailStates,airStates)

	CL = (4.266463)*sailStates.alpha + (0.350976)*sailStates.beta + (-2.246387)*sailStates.p + (35.262604)*sailStates.q + (-1.660642)*sailStates.r + (0.010851)*sailStates.de;
	CD = -0.252520;
	CY = (0.102452)*sailStates.alpha + (-0.023878)*sailStates.beta + (-0.562763)*sailStates.p + (0.294837)*sailStates.q + (-0.111930)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.195736)*sailStates.alpha + (0.370380)*sailStates.beta + (-0.908226)*sailStates.p + (7.895149)*sailStates.q + (-1.284894)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-12.699513)*sailStates.alpha + (-1.267302)*sailStates.beta + (6.704250)*sailStates.p + (-126.097916)*sailStates.q + (5.509299)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (-0.372486)*sailStates.alpha + (0.050462)*sailStates.beta + (1.134764)*sailStates.p + (-4.942937)*sailStates.q + (0.006032)*sailStates.r + (-0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end