function [aeroForces] = paramSpace_2_4_1_3_3_2_3(sailStates,airStates)

	CL = (3.967880)*sailStates.alpha + (0.124098)*sailStates.beta + (-2.801949)*sailStates.p + (36.863575)*sailStates.q + (-0.508836)*sailStates.r + (0.010954)*sailStates.de;
	CD = 0.034320;
	CY = (0.049961)*sailStates.alpha + (-0.024006)*sailStates.beta + (-0.188514)*sailStates.p + (0.563442)*sailStates.q + (-0.012415)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.289080)*sailStates.alpha + (0.104638)*sailStates.beta + (-1.359272)*sailStates.p + (11.090353)*sailStates.q + (-0.393877)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.276608)*sailStates.alpha + (-0.533639)*sailStates.beta + (9.496362)*sailStates.p + (-143.062881)*sailStates.q + (1.749570)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.016537)*sailStates.alpha + (0.004121)*sailStates.beta + (0.310403)*sailStates.p + (-1.423157)*sailStates.q + (0.000180)*sailStates.r + (-0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end