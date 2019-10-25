function [aeroForces] = paramSpace_2_1_1_1_3_2_1(sailStates,airStates)

	CL = (3.862770)*sailStates.alpha + (-0.079917)*sailStates.beta + (-1.673838)*sailStates.p + (27.570679)*sailStates.q + (-0.454191)*sailStates.r + (0.010572)*sailStates.de;
	CD = -0.027540;
	CY = (0.318458)*sailStates.alpha + (-0.025257)*sailStates.beta + (-0.294583)*sailStates.p + (1.697131)*sailStates.q + (-0.000159)*sailStates.r + (0.000359)*sailStates.de;

	Cl = (0.803958)*sailStates.alpha + (0.052649)*sailStates.beta + (-0.524688)*sailStates.p + (3.550639)*sailStates.q + (-0.393674)*sailStates.r + (-0.000690)*sailStates.de;
	Cm = (-13.963030)*sailStates.alpha + (0.347388)*sailStates.beta + (5.800461)*sailStates.p + (-112.341370)*sailStates.q + (1.545096)*sailStates.r + (-0.067299)*sailStates.de;
	Cn = (-0.632207)*sailStates.alpha + (0.000606)*sailStates.beta + (0.591655)*sailStates.p + (-3.820230)*sailStates.q + (0.000026)*sailStates.r + (-0.000515)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end