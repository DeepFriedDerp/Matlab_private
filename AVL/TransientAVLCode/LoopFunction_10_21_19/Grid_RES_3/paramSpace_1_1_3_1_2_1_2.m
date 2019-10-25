function [aeroForces] = paramSpace_1_1_3_1_2_1_2(sailStates,airStates)

	CL = (6.504970)*sailStates.alpha + (-0.600670)*sailStates.beta + (-2.638624)*sailStates.p + (42.006763)*sailStates.q + (-3.107980)*sailStates.r + (0.012105)*sailStates.de;
	CD = -2.361580;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-1.213898)*sailStates.p + (0.000001)*sailStates.q + (-0.214043)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.989491)*sailStates.alpha + (0.422008)*sailStates.beta + (-1.257543)*sailStates.p + (12.213090)*sailStates.q + (-2.662791)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-11.308961)*sailStates.alpha + (2.212060)*sailStates.beta + (6.960948)*sailStates.p + (-134.612778)*sailStates.q + (10.312713)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.087144)*sailStates.alpha + (0.111758)*sailStates.beta + (2.585898)*sailStates.p + (-11.068127)*sailStates.q + (0.025398)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end