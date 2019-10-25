function [aeroForces] = paramSpace_3_3_1_2_2_2_3(sailStates,airStates)

	CL = (3.994526)*sailStates.alpha + (-0.014724)*sailStates.beta + (-2.969290)*sailStates.p + (38.202576)*sailStates.q + (0.372197)*sailStates.r + (0.011288)*sailStates.de;
	CD = 0.032580;
	CY = (-0.001064)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.069309)*sailStates.p + (-0.100924)*sailStates.q + (-0.004532)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.356753)*sailStates.alpha + (-0.038759)*sailStates.beta + (-1.520473)*sailStates.p + (12.632401)*sailStates.q + (0.234256)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.514296)*sailStates.alpha + (0.023273)*sailStates.beta + (10.104674)*sailStates.p + (-148.239990)*sailStates.q + (-1.225264)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.080353)*sailStates.alpha + (0.002145)*sailStates.beta + (-0.081393)*sailStates.p + (0.255132)*sailStates.q + (-0.003790)*sailStates.r + (0.000060)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end