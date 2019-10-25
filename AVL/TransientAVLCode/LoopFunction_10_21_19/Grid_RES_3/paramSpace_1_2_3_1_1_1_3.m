function [aeroForces] = paramSpace_1_2_3_1_1_1_3(sailStates,airStates)

	CL = (5.130200)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.559736)*sailStates.p + (49.240639)*sailStates.q + (-2.987949)*sailStates.r + (0.012753)*sailStates.de;
	CD = -1.842720;
	CY = (-0.548406)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.042121)*sailStates.p + (-1.081938)*sailStates.q + (-0.183857)*sailStates.r + (-0.000234)*sailStates.de;

	Cl = (1.183884)*sailStates.alpha + (0.564228)*sailStates.beta + (-1.955653)*sailStates.p + (18.401899)*sailStates.q + (-2.556003)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (-9.350052)*sailStates.alpha + (0.000000)*sailStates.beta + (10.328112)*sailStates.p + (-161.621323)*sailStates.q + (9.939172)*sailStates.r + (-0.071238)*sailStates.de;
	Cn = (1.731978)*sailStates.alpha + (0.099489)*sailStates.beta + (2.106571)*sailStates.p + (-7.530120)*sailStates.q + (-0.018444)*sailStates.r + (0.000057)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end