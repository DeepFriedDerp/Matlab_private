function [aeroForces] = paramSpace_2_1_3_1_3_1_1(sailStates,airStates)

	CL = (7.098486)*sailStates.alpha + (-0.489936)*sailStates.beta + (-1.673838)*sailStates.p + (27.570679)*sailStates.q + (-2.652906)*sailStates.r + (0.010572)*sailStates.de;
	CD = -2.861110;
	CY = (0.688960)*sailStates.alpha + (-0.024405)*sailStates.beta + (-1.307595)*sailStates.p + (1.697129)*sailStates.q + (0.000159)*sailStates.r + (0.000359)*sailStates.de;

	Cl = (2.200449)*sailStates.alpha + (0.426111)*sailStates.beta + (-0.524688)*sailStates.p + (3.550639)*sailStates.q + (-2.409800)*sailStates.r + (-0.000690)*sailStates.de;
	Cm = (-15.323208)*sailStates.alpha + (1.839750)*sailStates.beta + (5.800461)*sailStates.p + (-112.341370)*sailStates.q + (8.981831)*sailStates.r + (-0.067299)*sailStates.de;
	Cn = (-2.556802)*sailStates.alpha + (-0.000854)*sailStates.beta + (2.892706)*sailStates.p + (-14.523564)*sailStates.q + (-0.000357)*sailStates.r + (-0.000689)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end