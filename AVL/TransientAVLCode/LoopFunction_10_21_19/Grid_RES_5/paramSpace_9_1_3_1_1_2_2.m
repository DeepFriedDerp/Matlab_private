function [aeroForces] = paramSpace_9_1_3_1_1_2_2(sailStates,airStates)

	CL = (5.171007)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.101531)*sailStates.p + (39.955051)*sailStates.q + (1.754795)*sailStates.r + (0.011514)*sailStates.de;
	CD = -0.984490;
	CY = (0.040120)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.823985)*sailStates.p + (-1.046665)*sailStates.q + (-0.028811)*sailStates.r + (-0.000228)*sailStates.de;

	Cl = (1.951770)*sailStates.alpha + (-0.369624)*sailStates.beta + (-1.633715)*sailStates.p + (13.877181)*sailStates.q + (1.571236)*sailStates.r + (0.001016)*sailStates.de;
	Cm = (-14.653324)*sailStates.alpha + (0.000000)*sailStates.beta + (10.319284)*sailStates.p + (-151.326889)*sailStates.q + (-5.959914)*sailStates.r + (-0.071886)*sailStates.de;
	Cn = (-0.328910)*sailStates.alpha + (0.012908)*sailStates.beta + (-1.758251)*sailStates.p + (8.529577)*sailStates.q + (0.008528)*sailStates.r + (0.000457)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end