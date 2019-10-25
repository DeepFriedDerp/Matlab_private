function [aeroForces] = paramSpace_1_4_4_3_2_1_2(sailStates,airStates)

	CL = (4.168222)*sailStates.alpha + (0.326253)*sailStates.beta + (-2.512296)*sailStates.p + (37.270481)*sailStates.q + (-1.627341)*sailStates.r + (0.011062)*sailStates.de;
	CD = -0.184650;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.501519)*sailStates.p + (-0.000001)*sailStates.q + (-0.099758)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.215638)*sailStates.alpha + (0.352274)*sailStates.beta + (-1.123351)*sailStates.p + (9.849136)*sailStates.q + (-1.241143)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-12.894262)*sailStates.alpha + (-1.124435)*sailStates.beta + (7.691377)*sailStates.p + (-133.820877)*sailStates.q + (5.389972)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.032101)*sailStates.alpha + (0.049255)*sailStates.beta + (0.972629)*sailStates.p + (-3.868859)*sailStates.q + (-0.009227)*sailStates.r + (-0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end