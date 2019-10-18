function [aeroForces] = paramSpace_2_1_1_1_2_2_2(sailStates,airStates)

	CL = (6.126228)*sailStates.alpha + (-1.921708)*sailStates.beta + (-3.740437)*sailStates.p + (51.103569)*sailStates.q + (2.155227)*sailStates.r + (0.012931)*sailStates.de;
	CD = -6.096080;
	CY = (2.029827)*sailStates.alpha + (-0.126500)*sailStates.beta + (0.217594)*sailStates.p + (16.238171)*sailStates.q + (-0.022896)*sailStates.r + (0.003442)*sailStates.de;

	Cl = (-5.210289)*sailStates.alpha + (-1.024508)*sailStates.beta + (-1.904574)*sailStates.p + (16.450911)*sailStates.q + (2.379117)*sailStates.r + (0.001686)*sailStates.de;
	Cm = (3.062667)*sailStates.alpha + (8.480548)*sailStates.beta + (11.778735)*sailStates.p + (-166.154648)*sailStates.q + (-7.591657)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (-2.263524)*sailStates.alpha + (0.209927)*sailStates.beta + (-0.719368)*sailStates.p + (-10.071507)*sailStates.q + (-0.198022)*sailStates.r + (-0.004473)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end