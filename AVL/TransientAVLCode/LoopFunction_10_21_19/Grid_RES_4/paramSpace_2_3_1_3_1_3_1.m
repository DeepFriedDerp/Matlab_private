function [aeroForces] = paramSpace_2_3_1_3_1_3_1(sailStates,airStates)

	CL = (4.233148)*sailStates.alpha + (-0.024460)*sailStates.beta + (-2.294086)*sailStates.p + (32.076981)*sailStates.q + (0.470802)*sailStates.r + (0.010717)*sailStates.de;
	CD = -0.173720;
	CY = (-0.101481)*sailStates.alpha + (-0.025237)*sailStates.beta + (0.301450)*sailStates.p + (-0.563440)*sailStates.q + (0.019818)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.190383)*sailStates.alpha + (-0.138697)*sailStates.beta + (-0.976697)*sailStates.p + (7.398247)*sailStates.q + (0.481493)*sailStates.r + (-0.000030)*sailStates.de;
	Cm = (-14.996829)*sailStates.alpha + (0.072418)*sailStates.beta + (8.085302)*sailStates.p + (-130.282166)*sailStates.q + (-1.557950)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (0.383265)*sailStates.alpha + (-0.007577)*sailStates.beta + (-0.729526)*sailStates.p + (4.018521)*sailStates.q + (-0.012391)*sailStates.r + (0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end