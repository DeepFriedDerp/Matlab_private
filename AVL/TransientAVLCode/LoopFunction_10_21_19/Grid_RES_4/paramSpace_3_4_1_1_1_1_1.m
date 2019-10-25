function [aeroForces] = paramSpace_3_4_1_1_1_1_1(sailStates,airStates)

	CL = (5.100519)*sailStates.alpha + (0.434875)*sailStates.beta + (-1.587633)*sailStates.p + (24.945080)*sailStates.q + (-1.575627)*sailStates.r + (0.010002)*sailStates.de;
	CD = -1.764770;
	CY = (0.104579)*sailStates.alpha + (-0.023682)*sailStates.beta + (-0.758957)*sailStates.p + (-1.471501)*sailStates.q + (0.049900)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (0.363482)*sailStates.alpha + (0.540593)*sailStates.beta + (-0.398474)*sailStates.p + (1.727778)*sailStates.q + (-1.623178)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.544738)*sailStates.alpha + (-1.827297)*sailStates.beta + (6.039870)*sailStates.p + (-111.058342)*sailStates.q + (5.383985)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-1.469550)*sailStates.alpha + (-0.026802)*sailStates.beta + (1.749778)*sailStates.p + (-6.715785)*sailStates.q + (-0.007179)*sailStates.r + (0.000301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end