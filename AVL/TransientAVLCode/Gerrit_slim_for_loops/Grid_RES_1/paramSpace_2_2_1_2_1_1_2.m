function [aeroForces] = paramSpace_2_2_1_2_1_1_2(sailStates,airStates)

	CL = (5.143369)*sailStates.alpha + (-3.757962)*sailStates.beta + (-3.416708)*sailStates.p + (46.912098)*sailStates.q + (2.147969)*sailStates.r + (0.010408)*sailStates.de;
	CD = -5.641260;
	CY = (1.727927)*sailStates.alpha + (-0.241497)*sailStates.beta + (0.300249)*sailStates.p + (15.069368)*sailStates.q + (-0.030990)*sailStates.r + (0.002867)*sailStates.de;

	Cl = (-5.070332)*sailStates.alpha + (-1.201326)*sailStates.beta + (-1.650987)*sailStates.p + (13.994148)*sailStates.q + (2.372921)*sailStates.r + (0.001186)*sailStates.de;
	Cm = (4.733313)*sailStates.alpha + (16.942892)*sailStates.beta + (10.646753)*sailStates.p + (-150.527252)*sailStates.q + (-7.611055)*sailStates.r + (-0.055184)*sailStates.de;
	Cn = (-1.774720)*sailStates.alpha + (0.339286)*sailStates.beta + (-0.876073)*sailStates.p + (-8.526970)*sailStates.q + (-0.189688)*sailStates.r + (-0.003751)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end