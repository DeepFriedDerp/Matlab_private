function [aeroForces] = paramSpace_3_3_3_2_3_3_3(sailStates,airStates)

	CL = (4.310073)*sailStates.alpha + (-0.098678)*sailStates.beta + (-3.002793)*sailStates.p + (39.401161)*sailStates.q + (1.199188)*sailStates.r + (0.011473)*sailStates.de;
	CD = -0.369510;
	CY = (0.160870)*sailStates.alpha + (-0.025238)*sailStates.beta + (0.451921)*sailStates.p + (0.668510)*sailStates.q + (-0.029597)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.332010)*sailStates.alpha + (-0.279346)*sailStates.beta + (-1.533354)*sailStates.p + (12.939311)*sailStates.q + (1.062892)*sailStates.r + (0.000852)*sailStates.de;
	Cm = (-13.690645)*sailStates.alpha + (0.392502)*sailStates.beta + (9.961652)*sailStates.p + (-148.601761)*sailStates.q + (-4.084109)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (-0.308738)*sailStates.alpha + (0.016582)*sailStates.beta + (-0.941197)*sailStates.p + (3.415083)*sailStates.q + (-0.001469)*sailStates.r + (-0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end