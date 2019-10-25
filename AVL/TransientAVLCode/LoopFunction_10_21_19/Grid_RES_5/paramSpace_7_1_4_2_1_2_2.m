function [aeroForces] = paramSpace_7_1_4_2_1_2_2(sailStates,airStates)

	CL = (4.246313)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.786671)*sailStates.p + (36.337681)*sailStates.q + (0.463911)*sailStates.r + (0.011160)*sailStates.de;
	CD = -0.139100;
	CY = (-0.020816)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.298008)*sailStates.p + (-0.381224)*sailStates.q + (0.010367)*sailStates.r + (-0.000083)*sailStates.de;

	Cl = (1.421535)*sailStates.alpha + (-0.133571)*sailStates.beta + (-1.387754)*sailStates.p + (11.311932)*sailStates.q + (0.491578)*sailStates.r + (0.000635)*sailStates.de;
	Cm = (-14.992853)*sailStates.alpha + (0.000000)*sailStates.beta + (9.628492)*sailStates.p + (-143.525848)*sailStates.q + (-1.606233)*sailStates.r + (-0.071036)*sailStates.de;
	Cn = (0.081733)*sailStates.alpha + (-0.004664)*sailStates.beta + (-0.681534)*sailStates.p + (3.396937)*sailStates.q + (-0.005188)*sailStates.r + (0.000149)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end