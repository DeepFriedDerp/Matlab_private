function [aeroForces] = paramSpace_14_1_3_1_1_1_1(sailStates,airStates)

	CL = (4.045888)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.846099)*sailStates.p + (26.483175)*sailStates.q + (-0.212988)*sailStates.r + (0.009359)*sailStates.de;
	CD = -0.426350;
	CY = (-0.005724)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.263382)*sailStates.p + (-0.550480)*sailStates.q + (0.055964)*sailStates.r + (-0.000115)*sailStates.de;

	Cl = (0.837903)*sailStates.alpha + (0.153499)*sailStates.beta + (-0.704064)*sailStates.p + (4.813116)*sailStates.q + (-0.443698)*sailStates.r + (-0.000377)*sailStates.de;
	Cm = (-14.746803)*sailStates.alpha + (0.000000)*sailStates.beta + (7.070997)*sailStates.p + (-119.415161)*sailStates.q + (0.624613)*sailStates.r + (-0.066020)*sailStates.de;
	Cn = (-0.465731)*sailStates.alpha + (-0.032627)*sailStates.beta + (0.740958)*sailStates.p + (-3.248773)*sailStates.q + (-0.031352)*sailStates.r + (0.000089)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end