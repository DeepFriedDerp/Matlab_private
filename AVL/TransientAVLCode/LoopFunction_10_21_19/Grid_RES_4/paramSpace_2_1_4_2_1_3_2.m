function [aeroForces] = paramSpace_2_1_4_2_1_3_2(sailStates,airStates)

	CL = (4.644840)*sailStates.alpha + (0.226174)*sailStates.beta + (-2.528905)*sailStates.p + (33.428036)*sailStates.q + (0.892169)*sailStates.r + (0.010678)*sailStates.de;
	CD = -0.554350;
	CY = (-0.092277)*sailStates.alpha + (-0.024209)*sailStates.beta + (0.548504)*sailStates.p + (-0.769435)*sailStates.q + (0.035870)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.590138)*sailStates.alpha + (-0.182946)*sailStates.beta + (-1.244369)*sailStates.p + (9.982982)*sailStates.q + (0.913969)*sailStates.r + (0.000486)*sailStates.de;
	Cm = (-15.375951)*sailStates.alpha + (-0.971864)*sailStates.beta + (9.007458)*sailStates.p + (-136.512222)*sailStates.q + (-3.045249)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (0.328187)*sailStates.alpha + (-0.018385)*sailStates.beta + (-1.261275)*sailStates.p + (6.418752)*sailStates.q + (-0.017622)*sailStates.r + (0.000306)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end