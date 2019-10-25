function [aeroForces] = paramSpace_5_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.289188)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.780481)*sailStates.p + (37.852383)*sailStates.q + (-1.217391)*sailStates.r + (0.011317)*sailStates.de;
	CD = -0.164990;
	CY = (0.024051)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.445494)*sailStates.p + (0.493723)*sailStates.q + (-0.046806)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.457406)*sailStates.alpha + (0.202857)*sailStates.beta + (-1.377129)*sailStates.p + (11.725485)*sailStates.q + (-0.979481)*sailStates.r + (0.000609)*sailStates.de;
	Cm = (-14.214530)*sailStates.alpha + (0.000000)*sailStates.beta + (9.091933)*sailStates.p + (-142.416916)*sailStates.q + (4.091796)*sailStates.r + (-0.070303)*sailStates.de;
	Cn = (0.061506)*sailStates.alpha + (0.021321)*sailStates.beta + (0.867362)*sailStates.p + (-3.885089)*sailStates.q + (0.003378)*sailStates.r + (-0.000225)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end