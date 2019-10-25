function [aeroForces] = paramSpace_1_4_2_1_1_2_1(sailStates,airStates)

	CL = (3.563215)*sailStates.alpha + (0.107892)*sailStates.beta + (-1.657930)*sailStates.p + (27.498575)*sailStates.q + (-0.213474)*sailStates.r + (0.010053)*sailStates.de;
	CD = 0.035170;
	CY = (-0.329370)*sailStates.alpha + (-0.032432)*sailStates.beta + (0.142645)*sailStates.p + (-2.326710)*sailStates.q + (0.028457)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (0.501903)*sailStates.alpha + (0.021826)*sailStates.beta + (-0.437937)*sailStates.p + (2.414831)*sailStates.q + (-0.043588)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-13.165075)*sailStates.alpha + (-0.446338)*sailStates.beta + (5.923090)*sailStates.p + (-112.315697)*sailStates.q + (0.793247)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (0.451798)*sailStates.alpha + (0.013207)*sailStates.beta + (-0.312274)*sailStates.p + (3.161284)*sailStates.q + (-0.053609)*sailStates.r + (0.000681)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end