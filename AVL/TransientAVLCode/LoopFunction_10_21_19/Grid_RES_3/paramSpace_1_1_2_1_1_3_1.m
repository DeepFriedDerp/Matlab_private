function [aeroForces] = paramSpace_1_1_2_1_1_3_1(sailStates,airStates)

	CL = (6.532162)*sailStates.alpha + (0.392136)*sailStates.beta + (-1.518153)*sailStates.p + (20.456762)*sailStates.q + (2.106251)*sailStates.r + (0.008845)*sailStates.de;
	CD = -2.691770;
	CY = (-0.676632)*sailStates.alpha + (-0.019135)*sailStates.beta + (1.200002)*sailStates.p + (-2.260754)*sailStates.q + (0.211593)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (1.975455)*sailStates.alpha + (-0.377189)*sailStates.beta + (-0.483475)*sailStates.p + (1.680217)*sailStates.q + (2.081222)*sailStates.r + (-0.000571)*sailStates.de;
	Cm = (-18.022234)*sailStates.alpha + (-1.501233)*sailStates.beta + (7.281004)*sailStates.p + (-112.748634)*sailStates.q + (-6.907128)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (2.557472)*sailStates.alpha + (-0.104616)*sailStates.beta + (-2.716071)*sailStates.p + (14.006084)*sailStates.q + (-0.096909)*sailStates.r + (0.000829)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end