function [aeroForces] = paramSpace_3_2_1_2_2_2_3(sailStates,airStates)

	CL = (3.994526)*sailStates.alpha + (0.014724)*sailStates.beta + (-2.969290)*sailStates.p + (38.202579)*sailStates.q + (0.372197)*sailStates.r + (0.011288)*sailStates.de;
	CD = 0.032580;
	CY = (-0.001064)*sailStates.alpha + (-0.025002)*sailStates.beta + (0.069309)*sailStates.p + (-0.100924)*sailStates.q + (-0.004532)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.401532)*sailStates.alpha + (-0.022232)*sailStates.beta + (-1.553124)*sailStates.p + (13.036276)*sailStates.q + (0.236353)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-14.514297)*sailStates.alpha + (-0.023273)*sailStates.beta + (10.104674)*sailStates.p + (-148.239975)*sailStates.q + (-1.225264)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.085967)*sailStates.alpha + (0.001853)*sailStates.beta + (-0.079253)*sailStates.p + (0.228661)*sailStates.q + (-0.003928)*sailStates.r + (0.000060)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end