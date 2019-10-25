function [aeroForces] = paramSpace_4_1_1_3_1_3_1(sailStates,airStates)

	CL = (4.291036)*sailStates.alpha + (0.330008)*sailStates.beta + (-2.247050)*sailStates.p + (35.214596)*sailStates.q + (1.652462)*sailStates.r + (0.010937)*sailStates.de;
	CD = -0.249490;
	CY = (-0.100855)*sailStates.alpha + (-0.025633)*sailStates.beta + (0.548487)*sailStates.p + (-0.294835)*sailStates.q + (-0.109069)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.335413)*sailStates.alpha + (-0.154059)*sailStates.beta + (-1.002955)*sailStates.p + (9.080811)*sailStates.q + (1.280466)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-12.895783)*sailStates.alpha + (-1.136417)*sailStates.beta + (6.713356)*sailStates.p + (-126.097916)*sailStates.q + (-5.463520)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.268752)*sailStates.alpha + (0.053612)*sailStates.beta + (-1.094518)*sailStates.p + (4.695487)*sailStates.q + (0.002390)*sailStates.r + (0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end