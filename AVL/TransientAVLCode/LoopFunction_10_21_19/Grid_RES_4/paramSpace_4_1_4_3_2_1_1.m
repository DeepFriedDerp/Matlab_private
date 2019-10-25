function [aeroForces] = paramSpace_4_1_4_3_2_1_1(sailStates,airStates)

	CL = (3.799967)*sailStates.alpha + (0.066831)*sailStates.beta + (-2.159766)*sailStates.p + (30.619455)*sailStates.q + (0.228557)*sailStates.r + (0.009770)*sailStates.de;
	CD = -0.042470;
	CY = (0.033541)*sailStates.alpha + (-0.024106)*sailStates.beta + (-0.092577)*sailStates.p + (0.194782)*sailStates.q + (0.018436)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.135733)*sailStates.alpha + (0.051383)*sailStates.beta + (-0.979372)*sailStates.p + (7.832010)*sailStates.q + (0.020366)*sailStates.r + (0.000127)*sailStates.de;
	Cm = (-14.066324)*sailStates.alpha + (-0.298387)*sailStates.beta + (7.718456)*sailStates.p + (-126.796555)*sailStates.q + (-0.848666)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.291207)*sailStates.alpha + (-0.013874)*sailStates.beta + (0.384134)*sailStates.p + (-2.568431)*sailStates.q + (-0.041978)*sailStates.r + (-0.000101)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end