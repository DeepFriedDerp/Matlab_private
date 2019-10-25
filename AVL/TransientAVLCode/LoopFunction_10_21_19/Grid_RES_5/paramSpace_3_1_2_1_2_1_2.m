function [aeroForces] = paramSpace_3_1_2_1_2_1_2(sailStates,airStates)

	CL = (5.243801)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.060462)*sailStates.p + (43.654724)*sailStates.q + (-2.604491)*sailStates.r + (0.011774)*sailStates.de;
	CD = -1.045270;
	CY = (-0.034262)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.011366)*sailStates.p + (1.304043)*sailStates.q + (-0.178378)*sailStates.r + (0.000280)*sailStates.de;

	Cl = (2.041185)*sailStates.alpha + (0.453669)*sailStates.beta + (-1.593023)*sailStates.p + (14.890738)*sailStates.q + (-2.167408)*sailStates.r + (0.000939)*sailStates.de;
	Cm = (-12.708630)*sailStates.alpha + (0.000000)*sailStates.beta + (8.876526)*sailStates.p + (-148.140839)*sailStates.q + (8.673627)*sailStates.r + (-0.069696)*sailStates.de;
	Cn = (0.603172)*sailStates.alpha + (0.079994)*sailStates.beta + (2.003854)*sailStates.p + (-8.987617)*sailStates.q + (0.020712)*sailStates.r + (-0.000550)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end