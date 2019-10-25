function [aeroForces] = paramSpace_1_3_3_3_2_3_1(sailStates,airStates)

	CL = (3.996287)*sailStates.alpha + (-0.009408)*sailStates.beta + (-2.189032)*sailStates.p + (30.743235)*sailStates.q + (-0.114566)*sailStates.r + (0.010180)*sailStates.de;
	CD = -0.112370;
	CY = (-0.037854)*sailStates.alpha + (-0.025225)*sailStates.beta + (0.154228)*sailStates.p + (-0.173373)*sailStates.q + (0.027178)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.009065)*sailStates.alpha + (-0.066810)*sailStates.beta + (-0.903330)*sailStates.p + (6.761171)*sailStates.q + (0.124315)*sailStates.r + (-0.000113)*sailStates.de;
	Cm = (-14.780272)*sailStates.alpha + (0.132340)*sailStates.beta + (7.832551)*sailStates.p + (-127.559647)*sailStates.q + (0.400203)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (0.286998)*sailStates.alpha + (-0.008331)*sailStates.beta + (-0.460519)*sailStates.p + (2.466491)*sailStates.q + (-0.031425)*sailStates.r + (0.000076)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end