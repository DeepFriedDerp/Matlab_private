function [aeroForces] = paramSpace_1_4_4_2_1_1_2(sailStates,airStates)

	CL = (4.243684)*sailStates.alpha + (0.383036)*sailStates.beta + (-2.561921)*sailStates.p + (38.418922)*sailStates.q + (-1.795044)*sailStates.r + (0.011317)*sailStates.de;
	CD = -0.357090;
	CY = (-0.101311)*sailStates.alpha + (-0.026957)*sailStates.beta + (-0.546944)*sailStates.p + (-0.756270)*sailStates.q + (-0.108875)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.105698)*sailStates.alpha + (0.415502)*sailStates.beta + (-1.145872)*sailStates.p + (10.145844)*sailStates.q + (-1.417392)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-12.188707)*sailStates.alpha + (-1.356204)*sailStates.beta + (7.714126)*sailStates.p + (-134.899979)*sailStates.q + (5.952319)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (0.042233)*sailStates.alpha + (0.061076)*sailStates.beta + (1.095910)*sailStates.p + (-3.837884)*sailStates.q + (-0.018734)*sailStates.r + (0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end