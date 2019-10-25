function [aeroForces] = paramSpace_2_2_3_3_2_3_2(sailStates,airStates)

	CL = (4.226218)*sailStates.alpha + (0.031166)*sailStates.beta + (-2.549756)*sailStates.p + (34.179840)*sailStates.q + (0.323349)*sailStates.r + (0.010899)*sailStates.de;
	CD = -0.153750;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.240204)*sailStates.p + (0.000000)*sailStates.q + (0.015744)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.318486)*sailStates.alpha + (-0.112914)*sailStates.beta + (-1.219038)*sailStates.p + (9.781989)*sailStates.q + (0.392732)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-15.024962)*sailStates.alpha + (-0.137966)*sailStates.beta + (8.903251)*sailStates.p + (-137.194580)*sailStates.q + (-1.106672)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.158109)*sailStates.alpha + (-0.008315)*sailStates.beta + (-0.602665)*sailStates.p + (2.932305)*sailStates.q + (-0.008564)*sailStates.r + (0.000045)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end