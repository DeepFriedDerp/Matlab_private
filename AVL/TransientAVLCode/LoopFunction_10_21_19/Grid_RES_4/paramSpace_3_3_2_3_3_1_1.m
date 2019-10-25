function [aeroForces] = paramSpace_3_3_2_3_3_1_1(sailStates,airStates)

	CL = (4.285505)*sailStates.alpha + (0.038742)*sailStates.beta + (-2.294524)*sailStates.p + (32.043957)*sailStates.q + (-0.487423)*sailStates.r + (0.010777)*sailStates.de;
	CD = -0.206220;
	CY = (0.104707)*sailStates.alpha + (-0.025157)*sailStates.beta + (-0.331264)*sailStates.p + (0.563442)*sailStates.q + (0.021692)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.196447)*sailStates.alpha + (0.153782)*sailStates.beta + (-0.976921)*sailStates.p + (7.396721)*sailStates.q + (-0.528930)*sailStates.r + (-0.000030)*sailStates.de;
	Cm = (-15.139761)*sailStates.alpha + (-0.163730)*sailStates.beta + (8.091609)*sailStates.p + (-130.282166)*sailStates.q + (1.654173)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (-0.391548)*sailStates.alpha + (-0.008714)*sailStates.beta + (0.773580)*sailStates.p + (-4.041799)*sailStates.q + (-0.011850)*sailStates.r + (-0.000219)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end