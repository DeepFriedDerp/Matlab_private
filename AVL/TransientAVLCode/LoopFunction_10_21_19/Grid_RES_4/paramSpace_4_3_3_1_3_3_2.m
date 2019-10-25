function [aeroForces] = paramSpace_4_3_3_1_3_3_2(sailStates,airStates)

	CL = (5.508012)*sailStates.alpha + (-0.227234)*sailStates.beta + (-2.698865)*sailStates.p + (42.964367)*sailStates.q + (2.816782)*sailStates.r + (0.012174)*sailStates.de;
	CD = -1.850000;
	CY = (0.239816)*sailStates.alpha + (-0.026804)*sailStates.beta + (0.996455)*sailStates.p + (1.664518)*sailStates.q + (-0.198148)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.079497)*sailStates.alpha + (-0.624771)*sailStates.beta + (-1.231485)*sailStates.p + (11.716947)*sailStates.q + (2.424707)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-9.440180)*sailStates.alpha + (0.872179)*sailStates.beta + (7.264005)*sailStates.p + (-137.222183)*sailStates.q + (-9.365847)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (-0.107640)*sailStates.alpha + (0.112307)*sailStates.beta + (-2.112674)*sailStates.p + (7.467093)*sailStates.q + (-0.013493)*sailStates.r + (-0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end