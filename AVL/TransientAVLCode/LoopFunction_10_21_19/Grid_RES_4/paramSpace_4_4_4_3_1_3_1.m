function [aeroForces] = paramSpace_4_4_4_3_1_3_1(sailStates,airStates)

	CL = (4.199457)*sailStates.alpha + (-0.391892)*sailStates.beta + (-2.245123)*sailStates.p + (35.358612)*sailStates.q + (1.676693)*sailStates.r + (0.010680)*sailStates.de;
	CD = -0.239190;
	CY = (-0.105647)*sailStates.alpha + (-0.023756)*sailStates.beta + (0.591315)*sailStates.p + (-0.294838)*sailStates.q + (-0.117651)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.200967)*sailStates.alpha + (-0.384931)*sailStates.beta + (-0.907606)*sailStates.p + (7.899591)*sailStates.q + (1.330916)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-12.306975)*sailStates.alpha + (1.529071)*sailStates.beta + (6.686038)*sailStates.p + (-126.097916)*sailStates.q + (-5.600855)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.380989)*sailStates.alpha + (0.052974)*sailStates.beta + (-1.177834)*sailStates.p + (4.965272)*sailStates.q + (0.005214)*sailStates.r + (0.000156)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end