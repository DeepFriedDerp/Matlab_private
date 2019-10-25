function [aeroForces] = paramSpace_4_4_4_2_3_3_3(sailStates,airStates)

	CL = (4.057869)*sailStates.alpha + (-0.467369)*sailStates.beta + (-2.946980)*sailStates.p + (41.866898)*sailStates.q + (1.977622)*sailStates.r + (0.011256)*sailStates.de;
	CD = -0.359160;
	CY = (0.171760)*sailStates.alpha + (-0.026377)*sailStates.beta + (0.638056)*sailStates.p + (0.455223)*sailStates.q + (-0.126868)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.201011)*sailStates.alpha + (-0.465907)*sailStates.beta + (-1.462823)*sailStates.p + (13.215231)*sailStates.q + (1.615405)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-11.339775)*sailStates.alpha + (1.825040)*sailStates.beta + (8.934983)*sailStates.p + (-145.756409)*sailStates.q + (-6.623023)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.482703)*sailStates.alpha + (0.068908)*sailStates.beta + (-1.197717)*sailStates.p + (3.949888)*sailStates.q + (-0.025599)*sailStates.r + (-0.000036)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end