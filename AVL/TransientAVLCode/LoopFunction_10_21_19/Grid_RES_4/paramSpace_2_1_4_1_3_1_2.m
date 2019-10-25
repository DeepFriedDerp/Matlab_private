function [aeroForces] = paramSpace_2_1_4_1_3_1_2(sailStates,airStates)

	CL = (7.571625)*sailStates.alpha + (-0.615884)*sailStates.beta + (-2.588434)*sailStates.p + (37.430916)*sailStates.q + (-2.982279)*sailStates.r + (0.011447)*sailStates.de;
	CD = -2.932670;
	CY = (0.226127)*sailStates.alpha + (-0.026056)*sailStates.beta + (-1.376553)*sailStates.p + (1.693498)*sailStates.q + (-0.090045)*sailStates.r + (0.000362)*sailStates.de;

	Cl = (2.932535)*sailStates.alpha + (0.419833)*sailStates.beta + (-1.255611)*sailStates.p + (11.046935)*sailStates.q + (-2.634806)*sailStates.r + (0.000430)*sailStates.de;
	Cm = (-15.192025)*sailStates.alpha + (2.288385)*sailStates.beta + (8.006815)*sailStates.p + (-135.354233)*sailStates.q + (10.055440)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (-0.518319)*sailStates.alpha + (0.044708)*sailStates.beta + (2.984831)*sailStates.p + (-14.687935)*sailStates.q + (0.027890)*sailStates.r + (-0.000746)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end