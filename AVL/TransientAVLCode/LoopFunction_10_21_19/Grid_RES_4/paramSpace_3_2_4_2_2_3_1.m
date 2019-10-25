function [aeroForces] = paramSpace_3_2_4_2_2_3_1(sailStates,airStates)

	CL = (4.528138)*sailStates.alpha + (0.110243)*sailStates.beta + (-2.190476)*sailStates.p + (32.942734)*sailStates.q + (1.302064)*sailStates.r + (0.011050)*sailStates.de;
	CD = -0.477630;
	CY = (-0.080310)*sailStates.alpha + (-0.024930)*sailStates.beta + (0.558438)*sailStates.p + (0.100924)*sailStates.q + (-0.036591)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.200487)*sailStates.alpha + (-0.255309)*sailStates.beta + (-0.903971)*sailStates.p + (7.259670)*sailStates.q + (1.166249)*sailStates.r + (-0.000139)*sailStates.de;
	Cm = (-13.920900)*sailStates.alpha + (-0.453003)*sailStates.beta + (7.185167)*sailStates.p + (-126.149185)*sailStates.q + (-4.444090)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.506519)*sailStates.alpha + (0.018987)*sailStates.beta + (-1.192460)*sailStates.p + (5.074284)*sailStates.q + (0.005273)*sailStates.r + (0.000049)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end