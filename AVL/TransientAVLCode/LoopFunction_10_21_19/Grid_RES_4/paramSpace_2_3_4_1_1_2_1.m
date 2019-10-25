function [aeroForces] = paramSpace_2_3_4_1_1_2_1(sailStates,airStates)

	CL = (3.879876)*sailStates.alpha + (-0.013217)*sailStates.beta + (-1.699253)*sailStates.p + (27.683174)*sailStates.q + (0.236071)*sailStates.r + (0.010694)*sailStates.de;
	CD = -0.018360;
	CY = (-0.329643)*sailStates.alpha + (-0.025456)*sailStates.beta + (0.256199)*sailStates.p + (-1.915493)*sailStates.q + (0.016590)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (0.673428)*sailStates.alpha + (-0.056537)*sailStates.beta + (-0.479755)*sailStates.p + (2.847513)*sailStates.q + (0.263343)*sailStates.r + (-0.000810)*sailStates.de;
	Cm = (-14.262520)*sailStates.alpha + (0.071191)*sailStates.beta + (6.001770)*sailStates.p + (-113.694908)*sailStates.q + (-0.798371)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (0.601330)*sailStates.alpha + (-0.002702)*sailStates.beta + (-0.518295)*sailStates.p + (3.633968)*sailStates.q + (-0.014621)*sailStates.r + (0.000577)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end