function [aeroForces] = paramSpace_2_1_1_3_1_3_3(sailStates,airStates)

	CL = (4.276918)*sailStates.alpha + (0.125501)*sailStates.beta + (-2.824126)*sailStates.p + (36.831036)*sailStates.q + (0.769931)*sailStates.r + (0.011092)*sailStates.de;
	CD = -0.209980;
	CY = (-0.022171)*sailStates.alpha + (-0.024706)*sailStates.beta + (0.369848)*sailStates.p + (-0.499211)*sailStates.q + (0.000047)*sailStates.r + (-0.000108)*sailStates.de;

	Cl = (1.530563)*sailStates.alpha + (-0.119524)*sailStates.beta + (-1.463790)*sailStates.p + (12.224720)*sailStates.q + (0.684671)*sailStates.r + (0.000802)*sailStates.de;
	Cm = (-14.654219)*sailStates.alpha + (-0.423804)*sailStates.beta + (9.655603)*sailStates.p + (-143.851379)*sailStates.q + (-2.583793)*sailStates.r + (-0.070292)*sailStates.de;
	Cn = (0.020569)*sailStates.alpha + (-0.000278)*sailStates.beta + (-0.828706)*sailStates.p + (4.256029)*sailStates.q + (-0.000264)*sailStates.r + (0.000234)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end