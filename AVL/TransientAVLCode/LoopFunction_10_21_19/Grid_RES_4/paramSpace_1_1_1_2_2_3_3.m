function [aeroForces] = paramSpace_1_1_1_2_2_3_3(sailStates,airStates)

	CL = (3.935663)*sailStates.alpha + (-0.018513)*sailStates.beta + (-2.770343)*sailStates.p + (34.786770)*sailStates.q + (-0.125294)*sailStates.r + (0.009825)*sailStates.de;
	CD = -0.242900;
	CY = (0.066240)*sailStates.alpha + (-0.025838)*sailStates.beta + (0.179172)*sailStates.p + (0.301043)*sailStates.q + (0.035607)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.416679)*sailStates.alpha + (-0.115768)*sailStates.beta + (-1.494445)*sailStates.p + (12.540344)*sailStates.q + (0.103770)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-14.179421)*sailStates.alpha + (0.098961)*sailStates.beta + (10.013623)*sailStates.p + (-144.677322)*sailStates.q + (0.523606)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.147803)*sailStates.alpha + (-0.028962)*sailStates.beta + (-0.700389)*sailStates.p + (4.128524)*sailStates.q + (-0.059726)*sailStates.r + (-0.000005)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end