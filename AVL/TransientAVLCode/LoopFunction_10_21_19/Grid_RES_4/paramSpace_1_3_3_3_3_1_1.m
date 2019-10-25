function [aeroForces] = paramSpace_1_3_3_3_3_1_1(sailStates,airStates)

	CL = (4.326856)*sailStates.alpha + (0.117787)*sailStates.beta + (-2.265265)*sailStates.p + (35.530933)*sailStates.q + (-1.668116)*sailStates.r + (0.011016)*sailStates.de;
	CD = -0.252510;
	CY = (0.102921)*sailStates.alpha + (-0.024673)*sailStates.beta + (-0.564396)*sailStates.p + (0.294837)*sailStates.q + (-0.112255)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.260817)*sailStates.alpha + (0.305222)*sailStates.beta + (-0.948503)*sailStates.p + (8.365998)*sailStates.q + (-1.296196)*sailStates.r + (-0.000073)*sailStates.de;
	Cm = (-12.902097)*sailStates.alpha + (-0.425224)*sailStates.beta + (6.766475)*sailStates.p + (-127.124184)*sailStates.q + (5.534334)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (-0.339220)*sailStates.alpha + (0.052931)*sailStates.beta + (1.130778)*sailStates.p + (-4.869416)*sailStates.q + (0.004584)*sailStates.r + (-0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end