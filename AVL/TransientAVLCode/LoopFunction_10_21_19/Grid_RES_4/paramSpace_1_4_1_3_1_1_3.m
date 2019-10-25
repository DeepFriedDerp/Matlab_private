function [aeroForces] = paramSpace_1_4_1_3_1_1_3(sailStates,airStates)

	CL = (3.901325)*sailStates.alpha + (0.385129)*sailStates.beta + (-2.775147)*sailStates.p + (39.471817)*sailStates.q + (-1.629012)*sailStates.r + (0.010931)*sailStates.de;
	CD = -0.114690;
	CY = (-0.094586)*sailStates.alpha + (-0.025816)*sailStates.beta + (-0.497846)*sailStates.p + (-0.294836)*sailStates.q + (-0.098996)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.190718)*sailStates.alpha + (0.365507)*sailStates.beta + (-1.337058)*sailStates.p + (11.811934)*sailStates.q + (-1.291005)*sailStates.r + (0.000563)*sailStates.de;
	Cm = (-12.085091)*sailStates.alpha + (-1.509641)*sailStates.beta + (8.638818)*sailStates.p + (-141.543854)*sailStates.q + (5.470163)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.273303)*sailStates.alpha + (0.053964)*sailStates.beta + (0.897235)*sailStates.p + (-2.839061)*sailStates.q + (-0.025773)*sailStates.r + (0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end