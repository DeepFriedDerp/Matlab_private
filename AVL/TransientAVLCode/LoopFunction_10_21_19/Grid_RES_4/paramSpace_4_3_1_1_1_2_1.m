function [aeroForces] = paramSpace_4_3_1_1_1_2_1(sailStates,airStates)

	CL = (3.866545)*sailStates.alpha + (-0.062546)*sailStates.beta + (-1.579505)*sailStates.p + (28.219940)*sailStates.q + (1.058929)*sailStates.r + (0.010374)*sailStates.de;
	CD = -0.044780;
	CY = (-0.267851)*sailStates.alpha + (-0.024015)*sailStates.beta + (0.359663)*sailStates.p + (-1.002334)*sailStates.q + (-0.071434)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (0.719825)*sailStates.alpha + (-0.159688)*sailStates.beta + (-0.417599)*sailStates.p + (3.054620)*sailStates.q + (0.709216)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-12.933220)*sailStates.alpha + (0.194700)*sailStates.beta + (4.861187)*sailStates.p + (-108.591927)*sailStates.q + (-3.490781)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (0.745149)*sailStates.alpha + (0.026169)*sailStates.beta + (-0.757159)*sailStates.p + (4.317063)*sailStates.q + (0.025617)*sailStates.r + (0.000329)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end