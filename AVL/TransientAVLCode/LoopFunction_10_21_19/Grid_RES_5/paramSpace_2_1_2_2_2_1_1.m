function [aeroForces] = paramSpace_2_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.167507)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.295069)*sailStates.p + (35.741196)*sailStates.q + (-1.614287)*sailStates.r + (0.010849)*sailStates.de;
	CD = -0.153940;
	CY = (0.079841)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.528217)*sailStates.p + (0.230434)*sailStates.q + (-0.112284)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.256148)*sailStates.alpha + (0.254980)*sailStates.beta + (-0.994766)*sailStates.p + (8.866329)*sailStates.q + (-1.250173)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-12.678032)*sailStates.alpha + (0.000000)*sailStates.beta + (6.900798)*sailStates.p + (-128.239044)*sailStates.q + (5.368543)*sailStates.r + (-0.066831)*sailStates.de;
	Cn = (-0.221140)*sailStates.alpha + (0.054198)*sailStates.beta + (1.021552)*sailStates.p + (-4.137087)*sailStates.q + (-0.003674)*sailStates.r + (-0.000137)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end