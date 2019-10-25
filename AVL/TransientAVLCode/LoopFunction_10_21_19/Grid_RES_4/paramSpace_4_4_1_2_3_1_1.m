function [aeroForces] = paramSpace_4_4_1_2_3_1_1(sailStates,airStates)

	CL = (4.288983)*sailStates.alpha + (0.111926)*sailStates.beta + (-2.019857)*sailStates.p + (27.912132)*sailStates.q + (-0.405152)*sailStates.r + (0.009719)*sailStates.de;
	CD = -0.467950;
	CY = (0.194617)*sailStates.alpha + (-0.027822)*sailStates.beta + (-0.438117)*sailStates.p + (1.057313)*sailStates.q + (0.087033)*sailStates.r + (0.000221)*sailStates.de;

	Cl = (1.075075)*sailStates.alpha + (0.208176)*sailStates.beta + (-0.778947)*sailStates.p + (5.180853)*sailStates.q + (-0.606695)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-15.534142)*sailStates.alpha + (-0.528848)*sailStates.beta + (7.799299)*sailStates.p + (-124.043571)*sailStates.q + (1.284230)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (-0.725741)*sailStates.alpha + (-0.025350)*sailStates.beta + (1.073209)*sailStates.p + (-5.803990)*sailStates.q + (-0.062137)*sailStates.r + (-0.000369)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end