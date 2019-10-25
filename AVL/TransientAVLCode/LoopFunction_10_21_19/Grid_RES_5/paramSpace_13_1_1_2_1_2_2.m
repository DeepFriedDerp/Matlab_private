function [aeroForces] = paramSpace_13_1_1_2_1_2_2(sailStates,airStates)

	CL = (4.262449)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.737849)*sailStates.p + (38.694134)*sailStates.q + (1.587465)*sailStates.r + (0.011312)*sailStates.de;
	CD = -0.161470;
	CY = (-0.026013)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.513936)*sailStates.p + (-0.546500)*sailStates.q + (-0.090562)*sailStates.r + (-0.000117)*sailStates.de;

	Cl = (1.451785)*sailStates.alpha + (-0.235163)*sailStates.beta + (-1.350721)*sailStates.p + (11.982437)*sailStates.q + (1.218567)*sailStates.r + (0.000588)*sailStates.de;
	Cm = (-13.617679)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.567344)*sailStates.p + (-140.819473)*sailStates.q + (-5.268718)*sailStates.r + (-0.068914)*sailStates.de;
	Cn = (-0.131510)*sailStates.alpha + (0.041466)*sailStates.beta + (-0.961117)*sailStates.p + (4.100189)*sailStates.q + (-0.003758)*sailStates.r + (0.000259)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end