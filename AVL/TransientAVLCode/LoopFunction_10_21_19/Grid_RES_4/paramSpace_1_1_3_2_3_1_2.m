function [aeroForces] = paramSpace_1_1_3_2_3_1_2(sailStates,airStates)

	CL = (4.786691)*sailStates.alpha + (-0.458116)*sailStates.beta + (-2.516518)*sailStates.p + (38.716358)*sailStates.q + (-2.191010)*sailStates.r + (0.011221)*sailStates.de;
	CD = -0.636980;
	CY = (0.105276)*sailStates.alpha + (-0.027114)*sailStates.beta + (-0.801692)*sailStates.p + (0.756268)*sailStates.q + (-0.159439)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.699939)*sailStates.alpha + (0.223587)*sailStates.beta + (-1.212133)*sailStates.p + (11.414742)*sailStates.q + (-1.777318)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-12.540167)*sailStates.alpha + (1.665492)*sailStates.beta + (7.186383)*sailStates.p + (-132.741776)*sailStates.q + (7.252022)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (-0.096016)*sailStates.alpha + (0.077480)*sailStates.beta + (1.605858)*sailStates.p + (-7.054163)*sailStates.q + (0.013794)*sailStates.r + (-0.000348)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end