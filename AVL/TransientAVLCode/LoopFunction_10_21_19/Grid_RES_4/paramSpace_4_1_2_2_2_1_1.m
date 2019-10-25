function [aeroForces] = paramSpace_4_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.076394)*sailStates.alpha + (-0.064619)*sailStates.beta + (-1.996929)*sailStates.p + (28.084656)*sailStates.q + (-0.203641)*sailStates.r + (0.009631)*sailStates.de;
	CD = -0.339830;
	CY = (0.087131)*sailStates.alpha + (-0.023859)*sailStates.beta + (-0.303656)*sailStates.p + (0.301044)*sailStates.q + (0.060390)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.099577)*sailStates.alpha + (0.122319)*sailStates.beta + (-0.859134)*sailStates.p + (6.410366)*sailStates.q + (-0.406039)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-14.912031)*sailStates.alpha + (0.309393)*sailStates.beta + (7.531329)*sailStates.p + (-122.964470)*sailStates.q + (0.613773)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.514309)*sailStates.alpha + (-0.034956)*sailStates.beta + (0.816980)*sailStates.p + (-4.308355)*sailStates.q + (-0.047782)*sailStates.r + (-0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end