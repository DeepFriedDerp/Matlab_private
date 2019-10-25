function [aeroForces] = paramSpace_3_2_4_3_3_1_1(sailStates,airStates)

	CL = (4.233148)*sailStates.alpha + (-0.024460)*sailStates.beta + (-2.294086)*sailStates.p + (32.076981)*sailStates.q + (-0.470802)*sailStates.r + (0.010717)*sailStates.de;
	CD = -0.173720;
	CY = (0.101481)*sailStates.alpha + (-0.024716)*sailStates.beta + (-0.301450)*sailStates.p + (0.563440)*sailStates.q + (0.019818)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.244766)*sailStates.alpha + (0.117154)*sailStates.beta + (-1.009342)*sailStates.p + (7.802126)*sailStates.q + (-0.479310)*sailStates.r + (0.000057)*sailStates.de;
	Cm = (-14.996829)*sailStates.alpha + (0.072419)*sailStates.beta + (8.085302)*sailStates.p + (-130.282166)*sailStates.q + (1.557949)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (-0.375619)*sailStates.alpha + (-0.009192)*sailStates.beta + (0.731665)*sailStates.p + (-4.044993)*sailStates.q + (-0.012534)*sailStates.r + (-0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end