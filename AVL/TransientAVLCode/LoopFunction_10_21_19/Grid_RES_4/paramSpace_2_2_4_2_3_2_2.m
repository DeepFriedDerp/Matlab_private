function [aeroForces] = paramSpace_2_2_4_2_3_2_2(sailStates,airStates)

	CL = (4.125113)*sailStates.alpha + (-0.021712)*sailStates.beta + (-2.559284)*sailStates.p + (34.986626)*sailStates.q + (-0.521370)*sailStates.r + (0.011085)*sailStates.de;
	CD = 0.013520;
	CY = (0.096948)*sailStates.alpha + (-0.025169)*sailStates.beta + (-0.177562)*sailStates.p + (0.769435)*sailStates.q + (-0.011557)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.323187)*sailStates.alpha + (0.046326)*sailStates.beta + (-1.219727)*sailStates.p + (10.000842)*sailStates.q + (-0.357968)*sailStates.r + (0.000370)*sailStates.de;
	Cm = (-14.843838)*sailStates.alpha + (0.047406)*sailStates.beta + (8.673260)*sailStates.p + (-136.832825)*sailStates.q + (1.725597)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (-0.086256)*sailStates.alpha + (0.003900)*sailStates.beta + (0.323030)*sailStates.p + (-1.929318)*sailStates.q + (0.002549)*sailStates.r + (-0.000264)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end