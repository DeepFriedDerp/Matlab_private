function [aeroForces] = paramSpace_2_1_2_3_2_3_3(sailStates,airStates)

	CL = (4.108993)*sailStates.alpha + (0.067575)*sailStates.beta + (-2.790202)*sailStates.p + (36.038666)*sailStates.q + (0.282834)*sailStates.r + (0.010829)*sailStates.de;
	CD = -0.138980;
	CY = (0.031234)*sailStates.alpha + (-0.024863)*sailStates.beta + (0.215272)*sailStates.p + (0.065300)*sailStates.q + (0.014107)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.434651)*sailStates.alpha + (-0.092567)*sailStates.beta + (-1.454825)*sailStates.p + (12.083300)*sailStates.q + (0.340426)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.586047)*sailStates.alpha + (-0.261739)*sailStates.beta + (9.701965)*sailStates.p + (-143.297119)*sailStates.q + (-0.949207)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.048063)*sailStates.alpha + (-0.008661)*sailStates.beta + (-0.575769)*sailStates.p + (2.931534)*sailStates.q + (-0.009192)*sailStates.r + (0.000038)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end