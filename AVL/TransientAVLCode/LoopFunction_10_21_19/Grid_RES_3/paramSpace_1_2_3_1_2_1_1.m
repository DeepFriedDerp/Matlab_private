function [aeroForces] = paramSpace_1_2_3_1_2_1_1(sailStates,airStates)

	CL = (6.275451)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.795471)*sailStates.p + (35.003597)*sailStates.q + (-2.809723)*sailStates.r + (0.011851)*sailStates.de;
	CD = -2.318290;
	CY = (0.337428)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.121361)*sailStates.p + (-0.589410)*sailStates.q + (-0.197782)*sailStates.r + (-0.000124)*sailStates.de;

	Cl = (1.313856)*sailStates.alpha + (0.584197)*sailStates.beta + (-0.518109)*sailStates.p + (5.019583)*sailStates.q + (-2.409976)*sailStates.r + (-0.000783)*sailStates.de;
	Cm = (-10.102718)*sailStates.alpha + (0.000000)*sailStates.beta + (4.216008)*sailStates.p + (-111.551048)*sailStates.q + (9.324839)*sailStates.r + (-0.066175)*sailStates.de;
	Cn = (-1.988860)*sailStates.alpha + (0.103010)*sailStates.beta + (2.524338)*sailStates.p + (-11.010377)*sailStates.q + (0.036224)*sailStates.r + (-0.000007)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end