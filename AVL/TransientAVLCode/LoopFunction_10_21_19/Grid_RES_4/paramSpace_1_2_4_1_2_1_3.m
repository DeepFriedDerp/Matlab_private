function [aeroForces] = paramSpace_1_2_4_1_2_1_3(sailStates,airStates)

	CL = (6.199401)*sailStates.alpha + (-0.248154)*sailStates.beta + (-3.503886)*sailStates.p + (50.404789)*sailStates.q + (-3.566150)*sailStates.r + (0.012815)*sailStates.de;
	CD = -2.403800;
	CY = (-0.407633)*sailStates.alpha + (-0.025612)*sailStates.beta + (-1.336905)*sailStates.p + (0.662187)*sailStates.q + (-0.265856)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (2.085565)*sailStates.alpha + (0.561077)*sailStates.beta + (-1.932839)*sailStates.p + (18.933296)*sailStates.q + (-3.013266)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-10.357299)*sailStates.alpha + (0.900495)*sailStates.beta + (9.468213)*sailStates.p + (-158.727341)*sailStates.q + (11.771027)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (1.895101)*sailStates.alpha + (0.129404)*sailStates.beta + (2.700717)*sailStates.p + (-11.326814)*sailStates.q + (0.013992)*sailStates.r + (-0.000491)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end