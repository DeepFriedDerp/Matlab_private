function [aeroForces] = paramSpace_1_3_1_1_3_3_1(sailStates,airStates)

	CL = (4.601388)*sailStates.alpha + (-0.092175)*sailStates.beta + (-1.408242)*sailStates.p + (20.431225)*sailStates.q + (1.172337)*sailStates.r + (0.008570)*sailStates.de;
	CD = -1.531260;
	CY = (-0.130989)*sailStates.alpha + (-0.023806)*sailStates.beta + (0.629763)*sailStates.p + (1.002337)*sailStates.q + (0.125160)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (0.371430)*sailStates.alpha + (-0.384123)*sailStates.beta + (-0.363035)*sailStates.p + (0.967188)*sailStates.q + (1.311273)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-14.578516)*sailStates.alpha + (0.342537)*sailStates.beta + (6.310109)*sailStates.p + (-108.591927)*sailStates.q + (-3.793442)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (1.347129)*sailStates.alpha + (-0.069168)*sailStates.beta + (-1.526872)*sailStates.p + (6.177166)*sailStates.q + (-0.028518)*sailStates.r + (-0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end