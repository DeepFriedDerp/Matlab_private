function [aeroForces] = paramSpace_3_1_1_1_1_1_1(sailStates,airStates)

	CL = (5.100519)*sailStates.alpha + (-0.434875)*sailStates.beta + (-1.587633)*sailStates.p + (24.945080)*sailStates.q + (-1.575627)*sailStates.r + (0.010002)*sailStates.de;
	CD = -1.764770;
	CY = (0.104579)*sailStates.alpha + (-0.025890)*sailStates.beta + (-0.758957)*sailStates.p + (-1.471501)*sailStates.q + (0.049900)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (0.557503)*sailStates.alpha + (0.330721)*sailStates.beta + (-0.496179)*sailStates.p + (2.936337)*sailStates.q + (-1.616902)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.544739)*sailStates.alpha + (1.827296)*sailStates.beta + (6.039871)*sailStates.p + (-111.058342)*sailStates.q + (5.383985)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-1.367183)*sailStates.alpha + (-0.030307)*sailStates.beta + (1.756182)*sailStates.p + (-6.794998)*sailStates.q + (-0.007590)*sailStates.r + (0.000301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end