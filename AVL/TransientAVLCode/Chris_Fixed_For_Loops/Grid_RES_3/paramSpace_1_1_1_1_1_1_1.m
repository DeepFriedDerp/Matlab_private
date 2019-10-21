function [aeroForces] = paramSpace_1_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.030901)*sailStates.alpha + (-0.147877)*sailStates.beta + (-2.297173)*sailStates.p + (35.043385)*sailStates.q + (-1.320562)*sailStates.r + (0.010894)*sailStates.de;
	CD = -0.118530;
	CY = (-0.042121)*sailStates.alpha + (-0.024018)*sailStates.beta + (-0.409728)*sailStates.p + (-0.678435)*sailStates.q + (-0.072182)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.100271)*sailStates.alpha + (0.194352)*sailStates.beta + (-1.004268)*sailStates.p + (8.639002)*sailStates.q + (-1.062758)*sailStates.r + (0.000083)*sailStates.de;
	Cm = (-12.716732)*sailStates.alpha + (0.587533)*sailStates.beta + (7.224440)*sailStates.p + (-128.743637)*sailStates.q + (4.453217)*sailStates.r + (-0.067501)*sailStates.de;
	Cn = (-0.088131)*sailStates.alpha + (0.039981)*sailStates.beta + (0.791438)*sailStates.p + (-2.459027)*sailStates.q + (-0.016950)*sailStates.r + (0.000144)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end