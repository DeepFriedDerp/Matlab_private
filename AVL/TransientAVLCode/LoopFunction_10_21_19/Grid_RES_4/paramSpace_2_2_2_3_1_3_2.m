function [aeroForces] = paramSpace_2_2_2_3_1_3_2(sailStates,airStates)

	CL = (4.281983)*sailStates.alpha + (0.029994)*sailStates.beta + (-2.554525)*sailStates.p + (34.168911)*sailStates.q + (0.444734)*sailStates.r + (0.010869)*sailStates.de;
	CD = -0.190620;
	CY = (-0.060959)*sailStates.alpha + (-0.024781)*sailStates.beta + (0.305766)*sailStates.p + (-0.498142)*sailStates.q + (0.020058)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.381530)*sailStates.alpha + (-0.122950)*sailStates.beta + (-1.222036)*sailStates.p + (9.774051)*sailStates.q + (0.475040)*sailStates.r + (0.000399)*sailStates.de;
	Cm = (-15.097064)*sailStates.alpha + (-0.112645)*sailStates.beta + (8.957121)*sailStates.p + (-137.428818)*sailStates.q + (-1.490401)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (0.241983)*sailStates.alpha + (-0.009433)*sailStates.beta + (-0.745930)*sailStates.p + (4.039260)*sailStates.q + (-0.012551)*sailStates.r + (0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end