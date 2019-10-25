function [aeroForces] = paramSpace_1_4_1_1_1_1_3(sailStates,airStates)

	CL = (4.980875)*sailStates.alpha + (0.747009)*sailStates.beta + (-3.531101)*sailStates.p + (50.009724)*sailStates.q + (-3.162796)*sailStates.r + (0.012384)*sailStates.de;
	CD = -1.885160;
	CY = (-0.569619)*sailStates.alpha + (-0.028288)*sailStates.beta + (-1.114669)*sailStates.p + (-1.002330)*sailStates.q + (-0.221614)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (1.068145)*sailStates.alpha + (0.807277)*sailStates.beta + (-1.890306)*sailStates.p + (17.985270)*sailStates.q + (-2.718329)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-8.038762)*sailStates.alpha + (-2.897519)*sailStates.beta + (9.941655)*sailStates.p + (-160.076111)*sailStates.q + (10.542453)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (1.764318)*sailStates.alpha + (0.119730)*sailStates.beta + (2.219201)*sailStates.p + (-7.724774)*sailStates.q + (-0.025035)*sailStates.r + (0.000073)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end