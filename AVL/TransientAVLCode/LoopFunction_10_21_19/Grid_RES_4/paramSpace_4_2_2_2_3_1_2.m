function [aeroForces] = paramSpace_4_2_2_2_3_1_2(sailStates,airStates)

	CL = (4.329925)*sailStates.alpha + (-0.022966)*sailStates.beta + (-2.425620)*sailStates.p + (31.530878)*sailStates.q + (-0.234201)*sailStates.r + (0.009969)*sailStates.de;
	CD = -0.425710;
	CY = (0.086546)*sailStates.alpha + (-0.024198)*sailStates.beta + (-0.374423)*sailStates.p + (0.756270)*sailStates.q + (0.074450)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.404336)*sailStates.alpha + (0.151917)*sailStates.beta + (-1.168501)*sailStates.p + (9.113689)*sailStates.q + (-0.438693)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-15.505723)*sailStates.alpha + (0.107458)*sailStates.beta + (9.104131)*sailStates.p + (-135.926239)*sailStates.q + (0.697808)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.435407)*sailStates.alpha + (-0.034900)*sailStates.beta + (1.025530)*sailStates.p + (-5.866389)*sailStates.q + (-0.070506)*sailStates.r + (-0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end