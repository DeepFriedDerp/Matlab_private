function [aeroForces] = paramSpace_1_2_1_1_3_3_1(sailStates,airStates)

	CL = (4.601388)*sailStates.alpha + (0.092175)*sailStates.beta + (-1.408242)*sailStates.p + (20.431227)*sailStates.q + (1.172338)*sailStates.r + (0.008570)*sailStates.de;
	CD = -1.531260;
	CY = (-0.130989)*sailStates.alpha + (-0.026147)*sailStates.beta + (0.629763)*sailStates.p + (1.002337)*sailStates.q + (0.125160)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (0.438699)*sailStates.alpha + (-0.325047)*sailStates.beta + (-0.394567)*sailStates.p + (1.364155)*sailStates.q + (1.304958)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-14.578517)*sailStates.alpha + (-0.342536)*sailStates.beta + (6.310109)*sailStates.p + (-108.591942)*sailStates.q + (-3.793441)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (1.328342)*sailStates.alpha + (-0.071895)*sailStates.beta + (-1.533144)*sailStates.p + (6.256128)*sailStates.q + (-0.029774)*sailStates.r + (-0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end