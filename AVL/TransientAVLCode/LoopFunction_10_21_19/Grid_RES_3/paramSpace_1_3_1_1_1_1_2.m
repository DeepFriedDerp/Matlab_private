function [aeroForces] = paramSpace_1_3_1_1_1_1_2(sailStates,airStates)

	CL = (5.480414)*sailStates.alpha + (0.598387)*sailStates.beta + (-2.680890)*sailStates.p + (41.876999)*sailStates.q + (-2.701469)*sailStates.r + (0.011907)*sailStates.de;
	CD = -1.859590;
	CY = (-0.235462)*sailStates.alpha + (-0.029455)*sailStates.beta + (-0.985936)*sailStates.p + (-1.671346)*sailStates.q + (-0.173688)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.041995)*sailStates.alpha + (0.710689)*sailStates.beta + (-1.199510)*sailStates.p + (11.079977)*sailStates.q + (-2.357998)*sailStates.r + (0.000317)*sailStates.de;
	Cm = (-9.717152)*sailStates.alpha + (-2.351081)*sailStates.beta + (7.447157)*sailStates.p + (-136.726761)*sailStates.q + (9.044759)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.031069)*sailStates.alpha + (0.098250)*sailStates.beta + (2.099884)*sailStates.p + (-7.494196)*sailStates.q + (-0.008757)*sailStates.r + (0.000306)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end