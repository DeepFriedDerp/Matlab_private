function [aeroForces] = paramSpace_4_1_2_3_1_2_1(sailStates,airStates)

	CL = (3.874021)*sailStates.alpha + (0.197581)*sailStates.beta + (-2.196464)*sailStates.p + (32.933334)*sailStates.q + (0.999353)*sailStates.r + (0.010395)*sailStates.de;
	CD = 0.040210;
	CY = (-0.066601)*sailStates.alpha + (-0.025694)*sailStates.beta + (0.259709)*sailStates.p + (-0.294837)*sailStates.q + (-0.051649)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.174987)*sailStates.alpha + (-0.053550)*sailStates.beta + (-0.986825)*sailStates.p + (8.468056)*sailStates.q + (0.690330)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-13.515487)*sailStates.alpha + (-0.680627)*sailStates.beta + (7.136665)*sailStates.p + (-126.097916)*sailStates.q + (-3.335405)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.052234)*sailStates.alpha + (0.022353)*sailStates.beta + (-0.426451)*sailStates.p + (1.614964)*sailStates.q + (-0.013494)*sailStates.r + (0.000117)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end