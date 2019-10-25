function [aeroForces] = paramSpace_2_4_3_2_2_1_2(sailStates,airStates)

	CL = (4.532159)*sailStates.alpha + (0.293626)*sailStates.beta + (-2.573580)*sailStates.p + (35.902306)*sailStates.q + (-1.335764)*sailStates.r + (0.011130)*sailStates.de;
	CD = -0.470270;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.544453)*sailStates.p + (-0.000001)*sailStates.q + (-0.035685)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.313121)*sailStates.alpha + (0.356218)*sailStates.beta + (-1.158385)*sailStates.p + (9.426311)*sailStates.q + (-1.156061)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.042656)*sailStates.alpha + (-1.105752)*sailStates.beta + (8.467438)*sailStates.p + (-136.150452)*sailStates.q + (4.517211)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.172423)*sailStates.alpha + (0.016475)*sailStates.beta + (1.163957)*sailStates.p + (-5.128999)*sailStates.q + (0.005477)*sailStates.r + (-0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end