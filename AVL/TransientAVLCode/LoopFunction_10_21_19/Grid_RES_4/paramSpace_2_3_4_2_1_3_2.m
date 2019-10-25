function [aeroForces] = paramSpace_2_3_4_2_1_3_2(sailStates,airStates)

	CL = (4.706044)*sailStates.alpha + (-0.075489)*sailStates.beta + (-2.548442)*sailStates.p + (33.693981)*sailStates.q + (0.889731)*sailStates.r + (0.010845)*sailStates.de;
	CD = -0.554110;
	CY = (-0.093009)*sailStates.alpha + (-0.025169)*sailStates.beta + (0.548099)*sailStates.p + (-0.769434)*sailStates.q + (0.035843)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.506445)*sailStates.alpha + (-0.262290)*sailStates.beta + (-1.188387)*sailStates.p + (9.251237)*sailStates.q + (0.916689)*sailStates.r + (0.000318)*sailStates.de;
	Cm = (-15.603856)*sailStates.alpha + (0.324660)*sailStates.beta + (9.074143)*sailStates.p + (-137.556381)*sailStates.q + (-3.037224)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (0.366955)*sailStates.alpha + (-0.015057)*sailStates.beta + (-1.256481)*sailStates.p + (6.364274)*sailStates.q + (-0.017372)*sailStates.r + (0.000308)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end