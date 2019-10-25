function [aeroForces] = paramSpace_1_1_2_2_3_1_3(sailStates,airStates)

	CL = (4.741800)*sailStates.alpha + (-0.414221)*sailStates.beta + (-2.925637)*sailStates.p + (41.614132)*sailStates.q + (-2.228630)*sailStates.r + (0.011435)*sailStates.de;
	CD = -0.644230;
	CY = (-0.000507)*sailStates.alpha + (-0.027419)*sailStates.beta + (-0.831503)*sailStates.p + (1.027327)*sailStates.q + (-0.146616)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.822707)*sailStates.alpha + (0.238510)*sailStates.beta + (-1.538901)*sailStates.p + (14.292966)*sailStates.q + (-1.829282)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-12.781632)*sailStates.alpha + (1.533271)*sailStates.beta + (8.706024)*sailStates.p + (-144.553253)*sailStates.q + (7.419615)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.428558)*sailStates.alpha + (0.069077)*sailStates.beta + (1.618245)*sailStates.p + (-7.105346)*sailStates.q + (0.010635)*sailStates.r + (-0.000438)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end