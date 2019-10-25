function [aeroForces] = paramSpace_2_4_2_2_2_1_3(sailStates,airStates)

	CL = (4.455353)*sailStates.alpha + (0.322536)*sailStates.beta + (-2.975518)*sailStates.p + (39.177456)*sailStates.q + (-1.397588)*sailStates.r + (0.011301)*sailStates.de;
	CD = -0.482510;
	CY = (-0.083263)*sailStates.alpha + (-0.024668)*sailStates.beta + (-0.575682)*sailStates.p + (0.100924)*sailStates.q + (-0.037736)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.442916)*sailStates.alpha + (0.373430)*sailStates.beta + (-1.486818)*sailStates.p + (12.475927)*sailStates.q + (-1.223091)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-13.732513)*sailStates.alpha + (-1.267126)*sailStates.beta + (9.806696)*sailStates.p + (-147.195892)*sailStates.q + (4.746185)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.221721)*sailStates.alpha + (0.017230)*sailStates.beta + (1.197918)*sailStates.p + (-5.167341)*sailStates.q + (0.004698)*sailStates.r + (-0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end