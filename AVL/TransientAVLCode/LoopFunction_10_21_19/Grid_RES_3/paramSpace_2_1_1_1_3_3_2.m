function [aeroForces] = paramSpace_2_1_1_1_3_3_2(sailStates,airStates)

	CL = (5.463059)*sailStates.alpha + (0.379868)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (1.762203)*sailStates.r + (0.010964)*sailStates.de;
	CD = -1.726340;
	CY = (0.210700)*sailStates.alpha + (-0.025257)*sailStates.beta + (0.757338)*sailStates.p + (1.697131)*sailStates.q + (-0.000159)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.239065)*sailStates.alpha + (-0.342354)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (1.683097)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-13.550207)*sailStates.alpha + (-1.461498)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (-5.991211)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (0.068479)*sailStates.alpha + (0.000393)*sailStates.beta + (-1.766733)*sailStates.p + (6.914761)*sailStates.q + (0.000101)*sailStates.r + (-0.000318)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end