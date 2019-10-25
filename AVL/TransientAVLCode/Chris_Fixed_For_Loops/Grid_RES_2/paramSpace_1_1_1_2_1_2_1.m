function [aeroForces] = paramSpace_1_1_1_2_1_2_1(sailStates,airStates)

	CL = (4.573385)*sailStates.alpha + (0.384505)*sailStates.beta + (-4.568832)*sailStates.p + (46.573437)*sailStates.q + (1.338863)*sailStates.r + (0.010563)*sailStates.de;
	CD = -2.877360;
	CY = (1.004282)*sailStates.alpha + (-0.029323)*sailStates.beta + (0.835378)*sailStates.p + (1.939453)*sailStates.q + (0.109842)*sailStates.r + (0.000429)*sailStates.de;

	Cl = (1.001417)*sailStates.alpha + (-0.424769)*sailStates.beta + (-2.987306)*sailStates.p + (25.689741)*sailStates.q + (1.481314)*sailStates.r + (0.003454)*sailStates.de;
	Cm = (-7.829136)*sailStates.alpha + (-1.529305)*sailStates.beta + (16.821125)*sailStates.p + (-195.819260)*sailStates.q + (-4.453826)*sailStates.r + (-0.075507)*sailStates.de;
	Cn = (-3.332407)*sailStates.alpha + (-0.074041)*sailStates.beta + (-2.333291)*sailStates.p + (10.850071)*sailStates.q + (-0.060234)*sailStates.r + (-0.000264)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end