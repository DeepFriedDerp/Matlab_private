function [aeroForces] = paramSpace_1_3_2_3_1_3_3(sailStates,airStates)

	CL = (3.967005)*sailStates.alpha + (0.021492)*sailStates.beta + (-2.707049)*sailStates.p + (34.988949)*sailStates.q + (-0.178922)*sailStates.r + (0.010322)*sailStates.de;
	CD = -0.116180;
	CY = (-0.020394)*sailStates.alpha + (-0.025633)*sailStates.beta + (0.158102)*sailStates.p + (-0.318252)*sailStates.q + (0.027878)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.272995)*sailStates.alpha + (-0.054986)*sailStates.beta + (-1.325737)*sailStates.p + (10.700199)*sailStates.q + (0.049759)*sailStates.r + (0.000580)*sailStates.de;
	Cm = (-14.493958)*sailStates.alpha + (-0.046645)*sailStates.beta + (9.618266)*sailStates.p + (-142.287766)*sailStates.q + (0.649879)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.225092)*sailStates.alpha + (-0.005334)*sailStates.beta + (-0.554292)*sailStates.p + (3.475344)*sailStates.q + (-0.047744)*sailStates.r + (0.000136)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end