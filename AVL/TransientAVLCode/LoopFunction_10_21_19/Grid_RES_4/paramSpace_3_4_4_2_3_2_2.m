function [aeroForces] = paramSpace_3_4_4_2_3_2_2(sailStates,airStates)

	CL = (3.967954)*sailStates.alpha + (-0.073325)*sailStates.beta + (-2.554506)*sailStates.p + (34.685059)*sailStates.q + (0.143018)*sailStates.r + (0.010830)*sailStates.de;
	CD = 0.039210;
	CY = (0.094860)*sailStates.alpha + (-0.025851)*sailStates.beta + (-0.027063)*sailStates.p + (0.769435)*sailStates.q + (0.001855)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.157061)*sailStates.alpha + (-0.025854)*sailStates.beta + (-1.154640)*sailStates.p + (9.095526)*sailStates.q + (0.095181)*sailStates.r + (0.000226)*sailStates.de;
	Cm = (-14.416006)*sailStates.alpha + (0.360148)*sailStates.beta + (8.773362)*sailStates.p + (-136.512222)*sailStates.q + (-0.526347)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.162601)*sailStates.alpha + (0.002981)*sailStates.beta + (0.118283)*sailStates.p + (-1.440396)*sailStates.q + (-0.009423)*sailStates.r + (-0.000246)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end