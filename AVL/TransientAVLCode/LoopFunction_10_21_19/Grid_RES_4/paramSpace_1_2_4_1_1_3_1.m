function [aeroForces] = paramSpace_1_2_4_1_1_3_1(sailStates,airStates)

	CL = (6.569473)*sailStates.alpha + (0.151408)*sailStates.beta + (-1.507749)*sailStates.p + (19.739277)*sailStates.q + (2.045386)*sailStates.r + (0.008830)*sailStates.de;
	CD = -2.707960;
	CY = (-0.681876)*sailStates.alpha + (-0.022744)*sailStates.beta + (1.201503)*sailStates.p + (-2.326711)*sailStates.q + (0.238744)*sailStates.r + (-0.000486)*sailStates.de;

	Cl = (1.907696)*sailStates.alpha + (-0.460393)*sailStates.beta + (-0.456523)*sailStates.p + (1.183898)*sailStates.q + (2.072762)*sailStates.r + (-0.000626)*sailStates.de;
	Cm = (-18.725021)*sailStates.alpha + (-0.603690)*sailStates.beta + (7.474210)*sailStates.p + (-113.341965)*sailStates.q + (-6.666878)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (2.604238)*sailStates.alpha + (-0.107126)*sailStates.beta + (-2.713505)*sailStates.p + (13.864869)*sailStates.q + (-0.109397)*sailStates.r + (0.000842)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end