function [aeroForces] = paramSpace_2_4_4_2_1_3_2(sailStates,airStates)

	CL = (4.644840)*sailStates.alpha + (-0.226174)*sailStates.beta + (-2.528905)*sailStates.p + (33.428036)*sailStates.q + (0.892169)*sailStates.r + (0.010678)*sailStates.de;
	CD = -0.554350;
	CY = (-0.092276)*sailStates.alpha + (-0.025363)*sailStates.beta + (0.548504)*sailStates.p + (-0.769435)*sailStates.q + (0.035870)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.436878)*sailStates.alpha + (-0.300100)*sailStates.beta + (-1.146665)*sailStates.p + (8.774419)*sailStates.q + (0.920245)*sailStates.r + (0.000226)*sailStates.de;
	Cm = (-15.375951)*sailStates.alpha + (0.971864)*sailStates.beta + (9.007458)*sailStates.p + (-136.512222)*sailStates.q + (-3.045250)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (0.381889)*sailStates.alpha + (-0.013276)*sailStates.beta + (-1.254871)*sailStates.p + (6.339539)*sailStates.q + (-0.017210)*sailStates.r + (0.000306)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end