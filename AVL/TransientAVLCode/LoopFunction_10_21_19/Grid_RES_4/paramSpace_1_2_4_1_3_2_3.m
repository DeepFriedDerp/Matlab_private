function [aeroForces] = paramSpace_1_2_4_1_3_2_3(sailStates,airStates)

	CL = (3.984513)*sailStates.alpha + (-0.093643)*sailStates.beta + (-3.284682)*sailStates.p + (42.746956)*sailStates.q + (-1.740717)*sailStates.r + (0.011208)*sailStates.de;
	CD = -0.037240;
	CY = (0.098397)*sailStates.alpha + (-0.027209)*sailStates.beta + (-0.569455)*sailStates.p + (2.326708)*sailStates.q + (-0.113022)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (1.675103)*sailStates.alpha + (0.151379)*sailStates.beta + (-1.848496)*sailStates.p + (16.925774)*sailStates.q + (-1.274567)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-13.513085)*sailStates.alpha + (0.298217)*sailStates.beta + (10.370520)*sailStates.p + (-156.352325)*sailStates.q + (5.745368)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (0.546961)*sailStates.alpha + (0.038920)*sailStates.beta + (0.910699)*sailStates.p + (-4.585618)*sailStates.q + (0.000080)*sailStates.r + (-0.000779)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end