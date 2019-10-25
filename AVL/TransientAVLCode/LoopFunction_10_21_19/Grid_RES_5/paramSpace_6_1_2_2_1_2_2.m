function [aeroForces] = paramSpace_6_1_2_2_1_2_2(sailStates,airStates)

	CL = (4.172696)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.770805)*sailStates.p + (36.041840)*sailStates.q + (0.253349)*sailStates.r + (0.011006)*sailStates.de;
	CD = -0.109750;
	CY = (-0.023488)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.222276)*sailStates.p + (-0.351850)*sailStates.q + (0.015555)*sailStates.r + (-0.000076)*sailStates.de;

	Cl = (1.395834)*sailStates.alpha + (-0.096922)*sailStates.beta + (-1.381091)*sailStates.p + (11.232518)*sailStates.q + (0.308981)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.909341)*sailStates.alpha + (0.000000)*sailStates.beta + (9.643926)*sailStates.p + (-143.366257)*sailStates.q + (-0.842666)*sailStates.r + (-0.070788)*sailStates.de;
	Cn = (0.129707)*sailStates.alpha + (-0.006777)*sailStates.beta + (-0.578894)*sailStates.p + (3.237433)*sailStates.q + (-0.012161)*sailStates.r + (0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end