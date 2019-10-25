function [aeroForces] = paramSpace_10_1_3_2_2_2_1(sailStates,airStates)

	CL = (4.150643)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.372895)*sailStates.p + (33.943237)*sailStates.q + (0.760472)*sailStates.r + (0.011076)*sailStates.de;
	CD = -0.087480;
	CY = (0.035370)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.266401)*sailStates.p + (0.466417)*sailStates.q + (-0.018612)*sailStates.r + (0.000100)*sailStates.de;

	Cl = (1.143066)*sailStates.alpha + (-0.152046)*sailStates.beta + (-1.041047)*sailStates.p + (8.349090)*sailStates.q + (0.646654)*sailStates.r + (0.000073)*sailStates.de;
	Cm = (-14.300727)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.962258)*sailStates.p + (-131.613632)*sailStates.q + (-2.593274)*sailStates.r + (-0.069591)*sailStates.de;
	Cn = (0.084546)*sailStates.alpha + (0.010632)*sailStates.beta + (-0.546718)*sailStates.p + (1.906956)*sailStates.q + (-0.001959)*sailStates.r + (-0.000095)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end