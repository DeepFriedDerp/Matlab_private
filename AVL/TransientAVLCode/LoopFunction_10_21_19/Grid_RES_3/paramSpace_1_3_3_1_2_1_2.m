function [aeroForces] = paramSpace_1_3_3_1_2_1_2(sailStates,airStates)

	CL = (6.504970)*sailStates.alpha + (0.600670)*sailStates.beta + (-2.638624)*sailStates.p + (42.006763)*sailStates.q + (-3.107980)*sailStates.r + (0.012105)*sailStates.de;
	CD = -2.361580;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-1.213898)*sailStates.p + (0.000001)*sailStates.q + (-0.214043)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.884257)*sailStates.alpha + (0.781272)*sailStates.beta + (-1.172891)*sailStates.p + (11.152225)*sailStates.q + (-2.647965)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-11.308961)*sailStates.alpha + (-2.212058)*sailStates.beta + (6.960948)*sailStates.p + (-134.612778)*sailStates.q + (10.312715)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.251006)*sailStates.alpha + (0.100413)*sailStates.beta + (2.600825)*sailStates.p + (-11.255186)*sailStates.q + (0.028012)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end