function [aeroForces] = paramSpace_2_2_3_1_3_2_3(sailStates,airStates)

	CL = (3.948932)*sailStates.alpha + (-0.045418)*sailStates.beta + (-3.434478)*sailStates.p + (42.221924)*sailStates.q + (-0.886942)*sailStates.r + (0.011513)*sailStates.de;
	CD = -0.045090;
	CY = (0.105110)*sailStates.alpha + (-0.025592)*sailStates.beta + (-0.377699)*sailStates.p + (1.915492)*sailStates.q + (-0.024688)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (1.591812)*sailStates.alpha + (0.091057)*sailStates.beta + (-1.936538)*sailStates.p + (16.724155)*sailStates.q + (-0.673572)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-13.927119)*sailStates.alpha + (0.149092)*sailStates.beta + (11.517563)*sailStates.p + (-160.694275)*sailStates.q + (2.966365)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (0.225183)*sailStates.alpha + (0.007850)*sailStates.beta + (0.677983)*sailStates.p + (-4.075070)*sailStates.q + (0.008476)*sailStates.r + (-0.000628)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end