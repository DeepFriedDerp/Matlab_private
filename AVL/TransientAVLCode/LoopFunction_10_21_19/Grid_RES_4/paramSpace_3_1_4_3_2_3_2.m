function [aeroForces] = paramSpace_3_1_4_3_2_3_2(sailStates,airStates)

	CL = (4.219282)*sailStates.alpha + (0.253434)*sailStates.beta + (-2.563787)*sailStates.p + (35.508430)*sailStates.q + (0.996514)*sailStates.r + (0.010985)*sailStates.de;
	CD = -0.187200;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.405653)*sailStates.p + (0.000000)*sailStates.q + (-0.026588)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.377201)*sailStates.alpha + (-0.135282)*sailStates.beta + (-1.252894)*sailStates.p + (10.523695)*sailStates.q + (0.876386)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.069390)*sailStates.alpha + (-1.052053)*sailStates.beta + (8.540085)*sailStates.p + (-136.150452)*sailStates.q + (-3.408827)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.039109)*sailStates.alpha + (0.013783)*sailStates.beta + (-0.823081)*sailStates.p + (3.353602)*sailStates.q + (0.001588)*sailStates.r + (0.000052)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end