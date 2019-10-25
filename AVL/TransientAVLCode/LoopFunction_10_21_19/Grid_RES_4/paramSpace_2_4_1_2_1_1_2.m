function [aeroForces] = paramSpace_2_4_1_2_1_1_2(sailStates,airStates)

	CL = (4.322583)*sailStates.alpha + (0.308781)*sailStates.beta + (-2.580832)*sailStates.p + (35.892735)*sailStates.q + (-1.152209)*sailStates.r + (0.011071)*sailStates.de;
	CD = -0.368460;
	CY = (-0.097457)*sailStates.alpha + (-0.025851)*sailStates.beta + (-0.449783)*sailStates.p + (-0.769434)*sailStates.q + (-0.029399)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.141550)*sailStates.alpha + (0.328094)*sailStates.beta + (-1.162970)*sailStates.p + (9.414374)*sailStates.q + (-1.039355)*sailStates.r + (0.000226)*sailStates.de;
	Cm = (-13.672183)*sailStates.alpha + (-1.283263)*sailStates.beta + (8.549168)*sailStates.p + (-136.512222)*sailStates.q + (3.946902)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.040502)*sailStates.alpha + (0.016795)*sailStates.beta + (0.952436)*sailStates.p + (-3.424281)*sailStates.q + (-0.001137)*sailStates.r + (0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end