function [aeroForces] = paramSpace_3_1_1_3_1_1_2(sailStates,airStates)

	CL = (4.124331)*sailStates.alpha + (-0.097168)*sailStates.beta + (-2.525451)*sailStates.p + (33.924824)*sailStates.q + (-0.204416)*sailStates.r + (0.010761)*sailStates.de;
	CD = -0.119400;
	CY = (-0.061051)*sailStates.alpha + (-0.025160)*sailStates.beta + (-0.175037)*sailStates.p + (-0.498142)*sailStates.q + (0.011525)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.301993)*sailStates.alpha + (0.093488)*sailStates.beta + (-1.239372)*sailStates.p + (10.117807)*sailStates.q + (-0.309809)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.767551)*sailStates.alpha + (0.488927)*sailStates.beta + (8.782691)*sailStates.p + (-135.916275)*sailStates.q + (0.730799)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.066523)*sailStates.alpha + (-0.007841)*sailStates.beta + (0.462025)*sailStates.p + (-1.853360)*sailStates.q + (-0.005038)*sailStates.r + (0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end