function [aeroForces] = paramSpace_2_2_4_2_2_3_1(sailStates,airStates)

	CL = (4.444495)*sailStates.alpha + (0.068501)*sailStates.beta + (-2.138437)*sailStates.p + (30.478012)*sailStates.q + (0.740557)*sailStates.r + (0.010657)*sailStates.de;
	CD = -0.436470;
	CY = (-0.085737)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.439847)*sailStates.p + (-0.100923)*sailStates.q + (0.028818)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.154361)*sailStates.alpha + (-0.199151)*sailStates.beta + (-0.887641)*sailStates.p + (6.619678)*sailStates.q + (0.792976)*sailStates.r + (-0.000139)*sailStates.de;
	Cm = (-15.128186)*sailStates.alpha + (-0.300527)*sailStates.beta + (7.642725)*sailStates.p + (-126.149185)*sailStates.q + (-2.536891)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.524249)*sailStates.alpha + (-0.014719)*sailStates.beta + (-1.014844)*sailStates.p + (4.690090)*sailStates.q + (-0.011033)*sailStates.r + (0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end