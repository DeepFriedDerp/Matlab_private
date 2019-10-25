function [aeroForces] = paramSpace_2_3_4_2_2_3_1(sailStates,airStates)

	CL = (4.444495)*sailStates.alpha + (-0.068501)*sailStates.beta + (-2.138437)*sailStates.p + (30.478012)*sailStates.q + (0.740558)*sailStates.r + (0.010657)*sailStates.de;
	CD = -0.436470;
	CY = (-0.085737)*sailStates.alpha + (-0.025002)*sailStates.beta + (0.439847)*sailStates.p + (-0.100923)*sailStates.q + (0.028818)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.097313)*sailStates.alpha + (-0.232228)*sailStates.beta + (-0.854990)*sailStates.p + (6.215799)*sailStates.q + (0.795074)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-15.128186)*sailStates.alpha + (0.300527)*sailStates.beta + (7.642725)*sailStates.p + (-126.149185)*sailStates.q + (-2.536891)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.539421)*sailStates.alpha + (-0.013555)*sailStates.beta + (-1.012704)*sailStates.p + (4.663618)*sailStates.q + (-0.010896)*sailStates.r + (0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end