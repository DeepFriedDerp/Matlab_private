function [aeroForces] = paramSpace_3_1_2_2_2_1_3(sailStates,airStates)

	CL = (4.345302)*sailStates.alpha + (-0.169689)*sailStates.beta + (-2.923136)*sailStates.p + (36.745556)*sailStates.q + (-0.630002)*sailStates.r + (0.010845)*sailStates.de;
	CD = -0.416050;
	CY = (-0.077836)*sailStates.alpha + (-0.024883)*sailStates.beta + (-0.392976)*sailStates.p + (-0.100924)*sailStates.q + (0.025761)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.528501)*sailStates.alpha + (0.159348)*sailStates.beta + (-1.567989)*sailStates.p + (13.046049)*sailStates.q + (-0.683002)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.644889)*sailStates.alpha + (0.716466)*sailStates.beta + (10.258638)*sailStates.p + (-147.195892)*sailStates.q + (2.149122)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.077133)*sailStates.alpha + (-0.015009)*sailStates.beta + (0.972025)*sailStates.p + (-4.652621)*sailStates.q + (-0.012260)*sailStates.r + (-0.000050)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end