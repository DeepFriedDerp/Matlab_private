function [aeroForces] = paramSpace_4_3_4_2_3_2_2(sailStates,airStates)

	CL = (3.751450)*sailStates.alpha + (-0.070037)*sailStates.beta + (-2.501406)*sailStates.p + (35.230492)*sailStates.q + (0.805511)*sailStates.r + (0.010507)*sailStates.de;
	CD = 0.102980;
	CY = (0.094285)*sailStates.alpha + (-0.025859)*sailStates.beta + (0.123233)*sailStates.p + (0.756270)*sailStates.q + (-0.024431)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.125402)*sailStates.alpha + (-0.108741)*sailStates.beta + (-1.160689)*sailStates.p + (9.672256)*sailStates.q + (0.550495)*sailStates.r + (0.000340)*sailStates.de;
	Cm = (-13.432544)*sailStates.alpha + (0.284480)*sailStates.beta + (8.415782)*sailStates.p + (-135.926239)*sailStates.q + (-2.762755)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.236192)*sailStates.alpha + (0.020489)*sailStates.beta + (-0.090851)*sailStates.p + (-0.983629)*sailStates.q + (-0.045899)*sailStates.r + (-0.000222)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end