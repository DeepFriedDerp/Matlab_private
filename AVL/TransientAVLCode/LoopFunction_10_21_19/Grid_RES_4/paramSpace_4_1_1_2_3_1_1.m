function [aeroForces] = paramSpace_4_1_1_2_3_1_1(sailStates,airStates)

	CL = (4.288983)*sailStates.alpha + (-0.111926)*sailStates.beta + (-2.019857)*sailStates.p + (27.912127)*sailStates.q + (-0.405152)*sailStates.r + (0.009719)*sailStates.de;
	CD = -0.467950;
	CY = (0.194617)*sailStates.alpha + (-0.021751)*sailStates.beta + (-0.438117)*sailStates.p + (1.057313)*sailStates.q + (0.087033)*sailStates.r + (0.000221)*sailStates.de;

	Cl = (1.243338)*sailStates.alpha + (0.146294)*sailStates.beta + (-0.873353)*sailStates.p + (6.368735)*sailStates.q + (-0.588045)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-15.534142)*sailStates.alpha + (0.528848)*sailStates.beta + (7.799299)*sailStates.p + (-124.043571)*sailStates.q + (1.284229)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (-0.711164)*sailStates.alpha + (-0.045159)*sailStates.beta + (1.091988)*sailStates.p + (-6.040274)*sailStates.q + (-0.065847)*sailStates.r + (-0.000369)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end