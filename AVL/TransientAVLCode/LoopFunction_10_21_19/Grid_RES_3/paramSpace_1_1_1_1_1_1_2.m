function [aeroForces] = paramSpace_1_1_1_1_1_1_2(sailStates,airStates)

	CL = (5.480414)*sailStates.alpha + (-0.598387)*sailStates.beta + (-2.680890)*sailStates.p + (41.876995)*sailStates.q + (-2.701468)*sailStates.r + (0.011907)*sailStates.de;
	CD = -1.859590;
	CY = (-0.235462)*sailStates.alpha + (-0.020207)*sailStates.beta + (-0.985936)*sailStates.p + (-1.671346)*sailStates.q + (-0.173688)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.145628)*sailStates.alpha + (0.398056)*sailStates.beta + (-1.284128)*sailStates.p + (12.140842)*sailStates.q + (-2.373018)*sailStates.r + (0.000545)*sailStates.de;
	Cm = (-9.717152)*sailStates.alpha + (2.351081)*sailStates.beta + (7.447157)*sailStates.p + (-136.726761)*sailStates.q + (9.044758)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.183319)*sailStates.alpha + (0.097252)*sailStates.beta + (2.084964)*sailStates.p + (-7.307137)*sailStates.q + (-0.011405)*sailStates.r + (0.000306)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end