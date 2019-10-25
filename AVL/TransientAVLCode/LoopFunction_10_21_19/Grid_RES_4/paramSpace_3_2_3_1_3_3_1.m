function [aeroForces] = paramSpace_3_2_3_1_3_3_1(sailStates,airStates)

	CL = (5.332733)*sailStates.alpha + (0.174175)*sailStates.beta + (-1.756900)*sailStates.p + (30.375053)*sailStates.q + (2.000856)*sailStates.r + (0.011163)*sailStates.de;
	CD = -1.809570;
	CY = (-0.052749)*sailStates.alpha + (-0.024226)*sailStates.beta + (0.823290)*sailStates.p + (1.915493)*sailStates.q + (-0.053894)*sailStates.r + (0.000407)*sailStates.de;

	Cl = (0.567390)*sailStates.alpha + (-0.446238)*sailStates.beta + (-0.530557)*sailStates.p + (3.955018)*sailStates.q + (1.864210)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-11.531788)*sailStates.alpha + (-0.698288)*sailStates.beta + (5.502581)*sailStates.p + (-113.694908)*sailStates.q + (-6.817768)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (1.389767)*sailStates.alpha + (0.032224)*sailStates.beta + (-1.880784)*sailStates.p + (7.074852)*sailStates.q + (0.003206)*sailStates.r + (-0.000420)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end