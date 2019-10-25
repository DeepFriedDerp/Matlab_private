function [aeroForces] = paramSpace_13_1_4_1_1_2_2(sailStates,airStates)

	CL = (5.218750)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.059710)*sailStates.p + (43.698563)*sailStates.q + (2.613775)*sailStates.r + (0.011694)*sailStates.de;
	CD = -1.044350;
	CY = (0.037448)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.026069)*sailStates.p + (-1.304046)*sailStates.q + (-0.181063)*sailStates.r + (-0.000280)*sailStates.de;

	Cl = (2.044835)*sailStates.alpha + (-0.461029)*sailStates.beta + (-1.592673)*sailStates.p + (14.892711)*sailStates.q + (2.191413)*sailStates.r + (0.000939)*sailStates.de;
	Cm = (-12.533794)*sailStates.alpha + (0.000000)*sailStates.beta + (8.867036)*sailStates.p + (-148.140839)*sailStates.q + (-8.727445)*sailStates.r + (-0.069696)*sailStates.de;
	Cn = (-0.614592)*sailStates.alpha + (0.081292)*sailStates.beta + (-2.025963)*sailStates.p + (8.998807)*sailStates.q + (0.020218)*sailStates.r + (0.000537)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end