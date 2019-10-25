function [aeroForces] = paramSpace_1_3_1_1_2_1_3(sailStates,airStates)

	CL = (6.133511)*sailStates.alpha + (0.689388)*sailStates.beta + (-3.496340)*sailStates.p + (49.364799)*sailStates.q + (-3.438937)*sailStates.r + (0.012364)*sailStates.de;
	CD = -2.446250;
	CY = (-0.420864)*sailStates.alpha + (-0.023200)*sailStates.beta + (-1.346903)*sailStates.p + (0.589409)*sailStates.q + (-0.237551)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (2.016402)*sailStates.alpha + (0.852340)*sailStates.beta + (-1.876931)*sailStates.p + (17.887316)*sailStates.q + (-2.961764)*sailStates.r + (0.001364)*sailStates.de;
	Cm = (-10.165330)*sailStates.alpha + (-2.656117)*sailStates.beta + (9.735156)*sailStates.p + (-158.590927)*sailStates.q + (11.473591)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (1.755468)*sailStates.alpha + (0.108585)*sailStates.beta + (2.730448)*sailStates.p + (-11.439855)*sailStates.q + (0.017343)*sailStates.r + (-0.000421)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end