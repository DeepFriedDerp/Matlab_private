function [aeroForces] = paramSpace_4_3_2_1_1_1_3(sailStates,airStates)

	CL = (4.851893)*sailStates.alpha + (0.073760)*sailStates.beta + (-3.113711)*sailStates.p + (34.864140)*sailStates.q + (-0.501393)*sailStates.r + (0.009527)*sailStates.de;
	CD = -1.482600;
	CY = (-0.432838)*sailStates.alpha + (-0.022582)*sailStates.beta + (-0.447928)*sailStates.p + (-2.326706)*sailStates.q + (0.089182)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (1.273408)*sailStates.alpha + (0.324240)*sailStates.beta + (-1.762734)*sailStates.p + (14.436759)*sailStates.q + (-0.795932)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-14.471407)*sailStates.alpha + (-0.324400)*sailStates.beta + (11.831827)*sailStates.p + (-156.352325)*sailStates.q + (1.601125)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (0.567693)*sailStates.alpha + (-0.060486)*sailStates.beta + (1.409150)*sailStates.p + (-5.852866)*sailStates.q + (-0.052427)*sailStates.r + (0.000536)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end