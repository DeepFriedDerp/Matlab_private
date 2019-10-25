function [aeroForces] = paramSpace_2_1_1_1_2_3_1(sailStates,airStates)

	CL = (5.988902)*sailStates.alpha + (0.435151)*sailStates.beta + (-1.673838)*sailStates.p + (27.570679)*sailStates.q + (2.208488)*sailStates.r + (0.010572)*sailStates.de;
	CD = -2.236740;
	CY = (-0.377735)*sailStates.alpha + (-0.024831)*sailStates.beta + (1.032626)*sailStates.p + (-0.000000)*sailStates.q + (-0.000000)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.282084)*sailStates.alpha + (-0.383631)*sailStates.beta + (-0.524688)*sailStates.p + (3.550639)*sailStates.q + (2.046973)*sailStates.r + (-0.000690)*sailStates.de;
	Cm = (-13.680431)*sailStates.alpha + (-1.652064)*sailStates.beta + (5.800461)*sailStates.p + (-112.341370)*sailStates.q + (-7.492378)*sailStates.r + (-0.067299)*sailStates.de;
	Cn = (1.943848)*sailStates.alpha + (-0.000226)*sailStates.beta + (-2.329953)*sailStates.p + (10.719024)*sailStates.q + (-0.000123)*sailStates.r + (0.000169)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end