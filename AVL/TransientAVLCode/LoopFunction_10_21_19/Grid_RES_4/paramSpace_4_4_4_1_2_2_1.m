function [aeroForces] = paramSpace_4_4_4_1_2_2_1(sailStates,airStates)

	CL = (3.471398)*sailStates.alpha + (-0.186947)*sailStates.beta + (-1.608377)*sailStates.p + (27.820202)*sailStates.q + (0.646547)*sailStates.r + (0.009965)*sailStates.de;
	CD = 0.077890;
	CY = (0.030425)*sailStates.alpha + (-0.027100)*sailStates.beta + (0.135970)*sailStates.p + (0.662188)*sailStates.q + (-0.026975)*sailStates.r + (0.000137)*sailStates.de;

	Cl = (0.468729)*sailStates.alpha + (-0.121567)*sailStates.beta + (-0.407120)*sailStates.p + (2.503811)*sailStates.q + (0.415802)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-12.302056)*sailStates.alpha + (0.770792)*sailStates.beta + (5.345220)*sailStates.p + (-109.940704)*sailStates.q + (-2.208957)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (0.178338)*sailStates.alpha + (0.020055)*sailStates.beta + (-0.267040)*sailStates.p + (0.637315)*sailStates.q + (-0.013846)*sailStates.r + (-0.000184)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end