function [aeroForces] = paramSpace_3_2_1_1_3_2_2(sailStates,airStates)

	CL = (4.152169)*sailStates.alpha + (-0.008101)*sailStates.beta + (-2.584078)*sailStates.p + (34.850601)*sailStates.q + (-0.122051)*sailStates.r + (0.011090)*sailStates.de;
	CD = -0.012260;
	CY = (0.208653)*sailStates.alpha + (-0.024552)*sailStates.beta + (-0.220663)*sailStates.p + (1.693497)*sailStates.q + (0.014284)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.359628)*sailStates.alpha + (0.039103)*sailStates.beta + (-1.235157)*sailStates.p + (9.957820)*sailStates.q + (-0.167596)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-15.078513)*sailStates.alpha + (0.054350)*sailStates.beta + (8.956040)*sailStates.p + (-137.990799)*sailStates.q + (0.422673)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (-0.320344)*sailStates.alpha + (-0.003416)*sailStates.beta + (0.494717)*sailStates.p + (-3.600966)*sailStates.q + (-0.016153)*sailStates.r + (-0.000507)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end