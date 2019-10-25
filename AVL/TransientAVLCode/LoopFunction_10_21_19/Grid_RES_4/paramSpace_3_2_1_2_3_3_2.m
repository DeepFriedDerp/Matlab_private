function [aeroForces] = paramSpace_3_2_1_2_3_3_2(sailStates,airStates)

	CL = (4.389804)*sailStates.alpha + (0.081658)*sailStates.beta + (-2.601111)*sailStates.p + (36.109303)*sailStates.q + (1.128436)*sailStates.r + (0.011331)*sailStates.de;
	CD = -0.343120;
	CY = (0.098204)*sailStates.alpha + (-0.024783)*sailStates.beta + (0.405592)*sailStates.p + (0.769435)*sailStates.q + (-0.026665)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.267863)*sailStates.alpha + (-0.209142)*sailStates.beta + (-1.237697)*sailStates.p + (10.292809)*sailStates.q + (0.973769)*sailStates.r + (0.000405)*sailStates.de;
	Cm = (-14.109161)*sailStates.alpha + (-0.292315)*sailStates.beta + (8.625753)*sailStates.p + (-137.556381)*sailStates.q + (-3.803888)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.006248)*sailStates.alpha + (0.015424)*sailStates.beta + (-0.882805)*sailStates.p + (3.338607)*sailStates.q + (-0.000763)*sailStates.r + (-0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end