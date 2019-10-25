function [aeroForces] = paramSpace_4_1_3_2_2_3_1(sailStates,airStates)

	CL = (4.400053)*sailStates.alpha + (0.430529)*sailStates.beta + (-2.150730)*sailStates.p + (35.337204)*sailStates.q + (1.849724)*sailStates.r + (0.010953)*sailStates.de;
	CD = -0.483700;
	CY = (-0.071220)*sailStates.alpha + (-0.023797)*sailStates.beta + (0.647971)*sailStates.p + (0.301042)*sailStates.q + (-0.128879)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.226038)*sailStates.alpha + (-0.215846)*sailStates.beta + (-0.907658)*sailStates.p + (8.314768)*sailStates.q + (1.513947)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-11.749119)*sailStates.alpha + (-1.635825)*sailStates.beta + (6.184946)*sailStates.p + (-122.964470)*sailStates.q + (-6.154954)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.436116)*sailStates.alpha + (0.067962)*sailStates.beta + (-1.337305)*sailStates.p + (5.265718)*sailStates.q + (0.000718)*sailStates.r + (0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end