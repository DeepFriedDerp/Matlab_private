function [aeroForces] = paramSpace_1_2_4_1_1_1_2(sailStates,airStates)

	CL = (5.533118)*sailStates.alpha + (-0.212792)*sailStates.beta + (-2.700449)*sailStates.p + (42.866997)*sailStates.q + (-2.798962)*sailStates.r + (0.012350)*sailStates.de;
	CD = -1.813630;
	CY = (-0.239856)*sailStates.alpha + (-0.023379)*sailStates.beta + (-0.967436)*sailStates.p + (-1.664524)*sailStates.q + (-0.192614)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (1.133370)*sailStates.alpha + (0.488434)*sailStates.beta + (-1.263737)*sailStates.p + (12.109474)*sailStates.q + (-2.383870)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-9.862988)*sailStates.alpha + (0.783365)*sailStates.beta + (7.283786)*sailStates.p + (-137.222183)*sailStates.q + (9.266401)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.163997)*sailStates.alpha + (0.109297)*sailStates.beta + (2.062685)*sailStates.p + (-7.365790)*sailStates.q + (-0.013814)*sailStates.r + (0.000273)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end