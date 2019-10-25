function [aeroForces] = paramSpace_2_2_1_3_3_1_1(sailStates,airStates)

	CL = (4.371058)*sailStates.alpha + (-0.089352)*sailStates.beta + (-2.318108)*sailStates.p + (33.693733)*sailStates.q + (-1.094484)*sailStates.r + (0.011029)*sailStates.de;
	CD = -0.244320;
	CY = (0.106788)*sailStates.alpha + (-0.025176)*sailStates.beta + (-0.476267)*sailStates.p + (0.432842)*sailStates.q + (-0.031262)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.309283)*sailStates.alpha + (0.196973)*sailStates.beta + (-1.013873)*sailStates.p + (8.231865)*sailStates.q + (-0.954272)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.349929)*sailStates.alpha + (0.367633)*sailStates.beta + (7.681018)*sailStates.p + (-129.813766)*sailStates.q + (3.734021)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (-0.349689)*sailStates.alpha + (0.014994)*sailStates.beta + (0.983739)*sailStates.p + (-4.483100)*sailStates.q + (0.006055)*sailStates.r + (-0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end