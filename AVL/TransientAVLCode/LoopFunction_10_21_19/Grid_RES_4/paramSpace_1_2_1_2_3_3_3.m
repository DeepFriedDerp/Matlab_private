function [aeroForces] = paramSpace_1_2_1_2_3_3_3(sailStates,airStates)

	CL = (3.922807)*sailStates.alpha + (-0.015783)*sailStates.beta + (-2.766910)*sailStates.p + (35.180344)*sailStates.q + (-0.326418)*sailStates.r + (0.009976)*sailStates.de;
	CD = -0.161220;
	CY = (0.137550)*sailStates.alpha + (-0.026211)*sailStates.beta + (0.057175)*sailStates.p + (1.057313)*sailStates.q + (0.011259)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (1.339870)*sailStates.alpha + (-0.079478)*sailStates.beta + (-1.457992)*sailStates.p + (12.259714)*sailStates.q + (-0.054251)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-14.257946)*sailStates.alpha + (0.065056)*sailStates.beta + (9.816844)*sailStates.p + (-144.624481)*sailStates.q + (1.174027)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (0.092510)*sailStates.alpha + (-0.015691)*sailStates.beta + (-0.438057)*sailStates.p + (2.323797)*sailStates.q + (-0.040300)*sailStates.r + (-0.000241)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end