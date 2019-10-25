function [aeroForces] = paramSpace_3_1_4_2_2_1_3(sailStates,airStates)

	CL = (4.285256)*sailStates.alpha + (-0.126739)*sailStates.beta + (-2.922581)*sailStates.p + (36.778690)*sailStates.q + (-0.611487)*sailStates.r + (0.010784)*sailStates.de;
	CD = -0.374780;
	CY = (-0.072837)*sailStates.alpha + (-0.024926)*sailStates.beta + (-0.363045)*sailStates.p + (-0.100923)*sailStates.q + (0.023785)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.525716)*sailStates.alpha + (0.147132)*sailStates.beta + (-1.567717)*sailStates.p + (13.047543)*sailStates.q + (-0.634647)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.509297)*sailStates.alpha + (0.441740)*sailStates.beta + (10.251534)*sailStates.p + (-147.195892)*sailStates.q + (2.040732)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.057577)*sailStates.alpha + (-0.014302)*sailStates.beta + (0.927797)*sailStates.p + (-4.629826)*sailStates.q + (-0.012697)*sailStates.r + (-0.000076)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end