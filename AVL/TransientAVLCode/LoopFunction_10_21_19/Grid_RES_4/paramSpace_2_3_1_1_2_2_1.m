function [aeroForces] = paramSpace_2_3_1_1_2_2_1(sailStates,airStates)

	CL = (3.726369)*sailStates.alpha + (0.028538)*sailStates.beta + (-1.681721)*sailStates.p + (27.825686)*sailStates.q + (-0.228413)*sailStates.r + (0.010603)*sailStates.de;
	CD = 0.042080;
	CY = (-0.005008)*sailStates.alpha + (-0.025079)*sailStates.beta + (-0.061825)*sailStates.p + (-0.221995)*sailStates.q + (-0.004029)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (0.570140)*sailStates.alpha + (0.043066)*sailStates.beta + (-0.468869)*sailStates.p + (2.879413)*sailStates.q + (-0.167532)*sailStates.r + (-0.000847)*sailStates.de;
	Cm = (-13.632547)*sailStates.alpha + (-0.134009)*sailStates.beta + (5.799099)*sailStates.p + (-112.898659)*sailStates.q + (0.804318)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (-0.067734)*sailStates.alpha + (0.002693)*sailStates.beta + (0.109281)*sailStates.p + (-0.203980)*sailStates.q + (-0.002100)*sailStates.r + (0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end