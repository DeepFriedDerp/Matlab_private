function [aeroForces] = paramSpace_1_1_1_1_2_1_3(sailStates,airStates)

	CL = (6.099268)*sailStates.alpha + (-0.806250)*sailStates.beta + (-3.482018)*sailStates.p + (50.283798)*sailStates.q + (-3.588728)*sailStates.r + (0.012368)*sailStates.de;
	CD = -2.450880;
	CY = (-0.424314)*sailStates.alpha + (-0.027100)*sailStates.beta + (-1.379105)*sailStates.p + (0.662188)*sailStates.q + (-0.274392)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (2.083321)*sailStates.alpha + (0.410405)*sailStates.beta + (-1.954096)*sailStates.p + (19.259882)*sailStates.q + (-3.086935)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-9.574379)*sailStates.alpha + (3.092437)*sailStates.beta + (9.371916)*sailStates.p + (-157.701111)*sailStates.q + (11.917263)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (2.014453)*sailStates.alpha + (0.136161)*sailStates.beta + (2.758350)*sailStates.p + (-11.275807)*sailStates.q + (0.011682)*sailStates.r + (-0.000442)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end