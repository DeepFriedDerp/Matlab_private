function [aeroForces] = paramSpace_4_3_1_2_3_1_2(sailStates,airStates)

	CL = (4.376750)*sailStates.alpha + (0.029892)*sailStates.beta + (-2.426344)*sailStates.p + (31.482231)*sailStates.q + (-0.242766)*sailStates.r + (0.010057)*sailStates.de;
	CD = -0.444060;
	CY = (0.086550)*sailStates.alpha + (-0.025702)*sailStates.beta + (-0.388908)*sailStates.p + (0.756269)*sailStates.q + (0.077277)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.358500)*sailStates.alpha + (0.169954)*sailStates.beta + (-1.137317)*sailStates.p + (8.714498)*sailStates.q + (-0.468507)*sailStates.r + (0.000340)*sailStates.de;
	Cm = (-15.711934)*sailStates.alpha + (-0.151822)*sailStates.beta + (9.113931)*sailStates.p + (-135.926239)*sailStates.q + (0.747074)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.439215)*sailStates.alpha + (-0.029194)*sailStates.beta + (1.041034)*sailStates.p + (-5.798604)*sailStates.q + (-0.069102)*sailStates.r + (-0.000283)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end