function [aeroForces] = paramSpace_11_1_1_2_1_2_2(sailStates,airStates)

	CL = (4.296821)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.780913)*sailStates.p + (37.825844)*sailStates.q + (1.208269)*sailStates.r + (0.011366)*sailStates.de;
	CD = -0.157510;
	CY = (-0.025386)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.430557)*sailStates.p + (-0.493723)*sailStates.q + (-0.045201)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.455641)*sailStates.alpha + (-0.195387)*sailStates.beta + (-1.377335)*sailStates.p + (11.724279)*sailStates.q + (0.955375)*sailStates.r + (0.000609)*sailStates.de;
	Cm = (-14.322107)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.097430)*sailStates.p + (-142.416916)*sailStates.q + (-4.039493)*sailStates.r + (-0.070303)*sailStates.de;
	Cn = (-0.055985)*sailStates.alpha + (0.020536)*sailStates.beta + (-0.845235)*sailStates.p + (3.873621)*sailStates.q + (0.003297)*sailStates.r + (0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end