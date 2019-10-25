function [aeroForces] = paramSpace_1_4_1_2_2_3_3(sailStates,airStates)

	CL = (3.935663)*sailStates.alpha + (0.018513)*sailStates.beta + (-2.770343)*sailStates.p + (34.786770)*sailStates.q + (-0.125294)*sailStates.r + (0.009825)*sailStates.de;
	CD = -0.242900;
	CY = (0.066240)*sailStates.alpha + (-0.023734)*sailStates.beta + (0.179172)*sailStates.p + (0.301043)*sailStates.q + (0.035607)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.283296)*sailStates.alpha + (-0.089730)*sailStates.beta + (-1.400089)*sailStates.p + (11.352461)*sailStates.q + (0.122667)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-14.179421)*sailStates.alpha + (-0.098961)*sailStates.beta + (10.013622)*sailStates.p + (-144.677322)*sailStates.q + (0.523606)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.148828)*sailStates.alpha + (-0.011914)*sailStates.beta + (-0.681621)*sailStates.p + (3.892239)*sailStates.q + (-0.055968)*sailStates.r + (-0.000005)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end