function [aeroForces] = paramSpace_11_1_1_1_1_2_2(sailStates,airStates)

	CL = (5.238291)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.096982)*sailStates.p + (41.706490)*sailStates.q + (2.163333)*sailStates.r + (0.011805)*sailStates.de;
	CD = -0.996220;
	CY = (0.031472)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.891419)*sailStates.p + (-1.178222)*sailStates.q + (-0.093567)*sailStates.r + (-0.000256)*sailStates.de;

	Cl = (1.996648)*sailStates.alpha + (-0.398240)*sailStates.beta + (-1.621994)*sailStates.p + (14.363969)*sailStates.q + (1.823319)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.026890)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.705474)*sailStates.p + (-150.099487)*sailStates.q + (-7.246518)*sailStates.r + (-0.071133)*sailStates.de;
	Cn = (-0.443286)*sailStates.alpha + (0.041857)*sailStates.beta + (-1.836783)*sailStates.p + (8.756197)*sailStates.q + (0.018913)*sailStates.r + (0.000533)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end