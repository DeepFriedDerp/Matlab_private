function [aeroForces] = paramSpace_3_1_2_2_3_3_2(sailStates,airStates)

	CL = (4.332976)*sailStates.alpha + (0.265759)*sailStates.beta + (-2.581325)*sailStates.p + (35.859818)*sailStates.q + (1.134774)*sailStates.r + (0.011131)*sailStates.de;
	CD = -0.358480;
	CY = (0.097466)*sailStates.alpha + (-0.024046)*sailStates.beta + (0.420053)*sailStates.p + (0.769436)*sailStates.q + (-0.027559)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.293362)*sailStates.alpha + (-0.164699)*sailStates.beta + (-1.260903)*sailStates.p + (10.621429)*sailStates.q + (0.998239)*sailStates.r + (0.000486)*sailStates.de;
	Cm = (-13.816265)*sailStates.alpha + (-1.010663)*sailStates.beta + (8.555767)*sailStates.p + (-136.512222)*sailStates.q + (-3.846210)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.031800)*sailStates.alpha + (0.015823)*sailStates.beta + (-0.902096)*sailStates.p + (3.322088)*sailStates.q + (-0.000862)*sailStates.r + (-0.000136)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end