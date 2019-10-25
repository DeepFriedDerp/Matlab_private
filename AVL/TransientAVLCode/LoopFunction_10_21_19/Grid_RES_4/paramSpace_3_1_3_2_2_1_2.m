function [aeroForces] = paramSpace_3_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.394986)*sailStates.alpha + (-0.155495)*sailStates.beta + (-2.520674)*sailStates.p + (33.503437)*sailStates.q + (-0.673828)*sailStates.r + (0.010617)*sailStates.de;
	CD = -0.404350;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.394380)*sailStates.p + (0.000000)*sailStates.q + (0.025849)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.414104)*sailStates.alpha + (0.152083)*sailStates.beta + (-1.239301)*sailStates.p + (9.997926)*sailStates.q + (-0.702106)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.893966)*sailStates.alpha + (0.604212)*sailStates.beta + (8.912537)*sailStates.p + (-136.150452)*sailStates.q + (2.273684)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.209021)*sailStates.alpha + (-0.014830)*sailStates.beta + (0.961929)*sailStates.p + (-4.668074)*sailStates.q + (-0.011721)*sailStates.r + (-0.000086)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end