function [aeroForces] = paramSpace_1_3_2_3_1_1_2(sailStates,airStates)

	CL = (4.052754)*sailStates.alpha + (0.282980)*sailStates.beta + (-2.543367)*sailStates.p + (37.005245)*sailStates.q + (-1.407448)*sailStates.r + (0.011018)*sailStates.de;
	CD = -0.133990;
	CY = (-0.064111)*sailStates.alpha + (-0.026070)*sailStates.beta + (-0.422829)*sailStates.p + (-0.491626)*sailStates.q + (-0.074556)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.132705)*sailStates.alpha + (0.309286)*sailStates.beta + (-1.146600)*sailStates.p + (9.815379)*sailStates.q + (-1.101897)*sailStates.r + (0.000246)*sailStates.de;
	Cm = (-12.877047)*sailStates.alpha + (-1.057499)*sailStates.beta + (8.025088)*sailStates.p + (-135.234604)*sailStates.q + (4.715806)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.046818)*sailStates.alpha + (0.041766)*sailStates.beta + (0.805165)*sailStates.p + (-2.687792)*sailStates.q + (-0.016673)*sailStates.r + (0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end