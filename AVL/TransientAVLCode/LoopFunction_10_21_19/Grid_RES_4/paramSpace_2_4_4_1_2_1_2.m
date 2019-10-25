function [aeroForces] = paramSpace_2_4_4_1_2_1_2(sailStates,airStates)

	CL = (6.403051)*sailStates.alpha + (0.554542)*sailStates.beta + (-2.605480)*sailStates.p + (37.337391)*sailStates.q + (-2.539866)*sailStates.r + (0.011450)*sailStates.de;
	CD = -2.294360;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-1.102737)*sailStates.p + (0.000003)*sailStates.q + (-0.072277)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.824601)*sailStates.alpha + (0.711560)*sailStates.beta + (-1.168515)*sailStates.p + (9.808793)*sailStates.q + (-2.267154)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-13.558113)*sailStates.alpha + (-2.079019)*sailStates.beta + (8.201260)*sailStates.p + (-136.150452)*sailStates.q + (8.578304)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.395473)*sailStates.alpha + (0.032980)*sailStates.beta + (2.428959)*sailStates.p + (-10.964564)*sailStates.q + (0.015442)*sailStates.r + (-0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end