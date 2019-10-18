function [aeroForces] = paramSpace_1_2_2_2_1_1_1(sailStates,airStates)

	CL = (7.402561)*sailStates.alpha + (-0.542016)*sailStates.beta + (-2.572404)*sailStates.p + (29.597404)*sailStates.q + (0.408583)*sailStates.r + (0.008911)*sailStates.de;
	CD = -4.548060;
	CY = (1.759329)*sailStates.alpha + (-0.006314)*sailStates.beta + (-0.138348)*sailStates.p + (14.323281)*sailStates.q + (-0.014156)*sailStates.r + (0.003051)*sailStates.de;

	Cl = (-1.763196)*sailStates.alpha + (-0.528301)*sailStates.beta + (-1.360021)*sailStates.p + (11.111470)*sailStates.q + (1.045843)*sailStates.r + (0.000344)*sailStates.de;
	Cm = (-12.824702)*sailStates.alpha + (2.631440)*sailStates.beta + (9.337792)*sailStates.p + (-138.190109)*sailStates.q + (-1.629955)*sailStates.r + (-0.068412)*sailStates.de;
	Cn = (-1.825726)*sailStates.alpha + (-0.074191)*sailStates.beta + (-0.251643)*sailStates.p + (-9.236012)*sailStates.q + (0.119540)*sailStates.r + (-0.004059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end