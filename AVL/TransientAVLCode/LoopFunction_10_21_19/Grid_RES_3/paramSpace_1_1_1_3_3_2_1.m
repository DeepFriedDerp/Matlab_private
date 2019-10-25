function [aeroForces] = paramSpace_1_1_1_3_3_2_1(sailStates,airStates)

	CL = (3.854272)*sailStates.alpha + (-0.191266)*sailStates.beta + (-2.219178)*sailStates.p + (33.003220)*sailStates.q + (-0.921793)*sailStates.r + (0.010380)*sailStates.de;
	CD = 0.058590;
	CY = (0.070048)*sailStates.alpha + (-0.025711)*sailStates.beta + (-0.266982)*sailStates.p + (0.318252)*sailStates.q + (-0.047106)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.181826)*sailStates.alpha + (0.068085)*sailStates.beta + (-0.993232)*sailStates.p + (8.397524)*sailStates.q + (-0.668898)*sailStates.r + (0.000085)*sailStates.de;
	Cm = (-13.466179)*sailStates.alpha + (0.757192)*sailStates.beta + (7.276007)*sailStates.p + (-126.937798)*sailStates.q + (3.118397)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.065086)*sailStates.alpha + (0.020788)*sailStates.beta + (0.436881)*sailStates.p + (-1.595968)*sailStates.q + (-0.010194)*sailStates.r + (-0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end