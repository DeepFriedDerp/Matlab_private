function [aeroForces] = paramSpace_2_2_2_1_1_2_2(sailStates,airStates)

	CL = (5.245303)*sailStates.alpha + (-3.948067)*sailStates.beta + (-3.458046)*sailStates.p + (47.443314)*sailStates.q + (2.148496)*sailStates.r + (0.010396)*sailStates.de;
	CD = -5.942470;
	CY = (1.791980)*sailStates.alpha + (-0.277220)*sailStates.beta + (0.289372)*sailStates.p + (15.778722)*sailStates.q + (-0.026921)*sailStates.r + (0.003005)*sailStates.de;

	Cl = (-5.542737)*sailStates.alpha + (-1.225910)*sailStates.beta + (-1.678374)*sailStates.p + (14.226571)*sailStates.q + (2.419329)*sailStates.r + (0.001239)*sailStates.de;
	Cm = (5.699393)*sailStates.alpha + (18.113758)*sailStates.beta + (10.789721)*sailStates.p + (-151.754379)*sailStates.q + (-7.675320)*sailStates.r + (-0.055320)*sailStates.de;
	Cn = (-1.824519)*sailStates.alpha + (0.393257)*sailStates.beta + (-0.850186)*sailStates.p + (-9.349505)*sailStates.q + (-0.207162)*sailStates.r + (-0.003963)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end