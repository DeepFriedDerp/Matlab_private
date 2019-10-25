function [aeroForces] = paramSpace_1_1_1_1_2_1_3(sailStates,airStates)

	CL = (6.133512)*sailStates.alpha + (-0.689388)*sailStates.beta + (-3.496340)*sailStates.p + (49.364799)*sailStates.q + (-3.438937)*sailStates.r + (0.012364)*sailStates.de;
	CD = -2.446250;
	CY = (-0.420864)*sailStates.alpha + (-0.026462)*sailStates.beta + (-1.346903)*sailStates.p + (0.589409)*sailStates.q + (-0.237551)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (2.088132)*sailStates.alpha + (0.435826)*sailStates.beta + (-1.961548)*sailStates.p + (18.948187)*sailStates.q + (-2.976785)*sailStates.r + (0.001595)*sailStates.de;
	Cm = (-10.165330)*sailStates.alpha + (2.656117)*sailStates.beta + (9.735154)*sailStates.p + (-158.590912)*sailStates.q + (11.473592)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (1.923717)*sailStates.alpha + (0.118553)*sailStates.beta + (2.715527)*sailStates.p + (-11.252794)*sailStates.q + (0.014694)*sailStates.r + (-0.000421)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end