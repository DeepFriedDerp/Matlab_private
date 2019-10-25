function [aeroForces] = paramSpace_2_1_1_1_2_1_2(sailStates,airStates)

	CL = (4.767746)*sailStates.alpha + (-0.133274)*sailStates.beta + (-2.983517)*sailStates.p + (35.941948)*sailStates.q + (-0.754308)*sailStates.r + (0.010529)*sailStates.de;
	CD = -0.827200;
	CY = (-0.042447)*sailStates.alpha + (-0.023989)*sailStates.beta + (-0.581897)*sailStates.p + (0.715008)*sailStates.q + (0.076558)*sailStates.r + (0.000154)*sailStates.de;

	Cl = (1.787187)*sailStates.alpha + (0.230739)*sailStates.beta + (-1.622972)*sailStates.p + (13.236474)*sailStates.q + (-0.864240)*sailStates.r + (0.001138)*sailStates.de;
	Cm = (-15.450314)*sailStates.alpha + (0.572636)*sailStates.beta + (10.968799)*sailStates.p + (-150.764221)*sailStates.q + (2.521126)*sailStates.r + (-0.070345)*sailStates.de;
	Cn = (0.044322)*sailStates.alpha + (-0.039846)*sailStates.beta + (1.473135)*sailStates.p + (-7.865242)*sailStates.q + (-0.052127)*sailStates.r + (-0.000319)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end