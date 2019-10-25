function [aeroForces] = paramSpace_4_1_1_1_2_1_1(sailStates,airStates)

	CL = (5.487938)*sailStates.alpha + (-0.395108)*sailStates.beta + (-1.439716)*sailStates.p + (19.745590)*sailStates.q + (-1.626501)*sailStates.r + (0.008680)*sailStates.de;
	CD = -2.121290;
	CY = (0.424072)*sailStates.alpha + (-0.022885)*sailStates.beta + (-0.938452)*sailStates.p + (0.662189)*sailStates.q + (0.186599)*sailStates.r + (0.000137)*sailStates.de;

	Cl = (1.099964)*sailStates.alpha + (0.325694)*sailStates.beta + (-0.448523)*sailStates.p + (1.590709)*sailStates.q + (-1.721602)*sailStates.r + (-0.000648)*sailStates.de;
	Cm = (-16.454103)*sailStates.alpha + (1.614986)*sailStates.beta + (6.841671)*sailStates.p + (-109.940704)*sailStates.q + (5.314210)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (-1.969251)*sailStates.alpha + (-0.099261)*sailStates.beta + (2.163732)*sailStates.p + (-10.161324)*sailStates.q + (-0.070472)*sailStates.r + (-0.000332)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end