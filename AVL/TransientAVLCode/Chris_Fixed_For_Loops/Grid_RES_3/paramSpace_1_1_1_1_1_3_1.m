function [aeroForces] = paramSpace_1_1_1_1_1_3_1(sailStates,airStates)

	CL = (3.455457)*sailStates.alpha + (-0.041273)*sailStates.beta + (-3.498067)*sailStates.p + (41.808968)*sailStates.q + (-0.479212)*sailStates.r + (0.010746)*sailStates.de;
	CD = -0.045190;
	CY = (0.047632)*sailStates.alpha + (-0.025242)*sailStates.beta + (0.050066)*sailStates.p + (0.205514)*sailStates.q + (0.008808)*sailStates.r + (0.000045)*sailStates.de;

	Cl = (1.334076)*sailStates.alpha + (-0.052794)*sailStates.beta + (-2.033466)*sailStates.p + (17.650270)*sailStates.q + (-0.229141)*sailStates.r + (0.001814)*sailStates.de;
	Cm = (-12.661334)*sailStates.alpha + (0.165681)*sailStates.beta + (12.180079)*sailStates.p + (-164.704269)*sailStates.q + (1.685069)*sailStates.r + (-0.071400)*sailStates.de;
	Cn = (0.102987)*sailStates.alpha + (-0.009796)*sailStates.beta + (-0.464984)*sailStates.p + (3.443029)*sailStates.q + (-0.059341)*sailStates.r + (0.000001)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end