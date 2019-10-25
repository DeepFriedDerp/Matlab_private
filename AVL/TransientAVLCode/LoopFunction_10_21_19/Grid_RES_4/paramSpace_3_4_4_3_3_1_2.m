function [aeroForces] = paramSpace_3_4_4_3_3_1_2(sailStates,airStates)

	CL = (4.191646)*sailStates.alpha + (0.069098)*sailStates.beta + (-2.534752)*sailStates.p + (33.919167)*sailStates.q + (-0.438673)*sailStates.r + (0.010673)*sailStates.de;
	CD = -0.171370;
	CY = (0.060483)*sailStates.alpha + (-0.025475)*sailStates.beta + (-0.291535)*sailStates.p + (0.498142)*sailStates.q + (0.019161)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.258428)*sailStates.alpha + (0.154080)*sailStates.beta + (-1.147555)*sailStates.p + (8.894099)*sailStates.q + (-0.457440)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-14.802001)*sailStates.alpha + (-0.203237)*sailStates.beta + (8.887190)*sailStates.p + (-136.384674)*sailStates.q + (1.448896)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (-0.256556)*sailStates.alpha + (-0.005756)*sailStates.beta + (0.720547)*sailStates.p + (-3.976739)*sailStates.q + (-0.012637)*sailStates.r + (-0.000220)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end