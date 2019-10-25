function [aeroForces] = paramSpace_2_3_1_1_2_2_3(sailStates,airStates)

	CL = (3.684665)*sailStates.alpha + (0.039610)*sailStates.beta + (-3.450870)*sailStates.p + (42.162067)*sailStates.q + (-0.464803)*sailStates.r + (0.011455)*sailStates.de;
	CD = 0.046800;
	CY = (-0.021509)*sailStates.alpha + (-0.024874)*sailStates.beta + (-0.134315)*sailStates.p + (0.221995)*sailStates.q + (-0.008827)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.360775)*sailStates.alpha + (0.069803)*sailStates.beta + (-1.914199)*sailStates.p + (16.292185)*sailStates.q + (-0.359546)*sailStates.r + (0.001486)*sailStates.de;
	Cm = (-13.382870)*sailStates.alpha + (-0.172540)*sailStates.beta + (11.704208)*sailStates.p + (-161.490479)*sailStates.q + (1.608220)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (0.201385)*sailStates.alpha + (0.004005)*sailStates.beta + (0.162820)*sailStates.p + (-0.321692)*sailStates.q + (-0.004922)*sailStates.r + (-0.000057)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end