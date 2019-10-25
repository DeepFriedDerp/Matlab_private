function [aeroForces] = paramSpace_15_1_4_1_1_1_2(sailStates,airStates)

	CL = (3.893090)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.754652)*sailStates.p + (34.341267)*sailStates.q + (0.405750)*sailStates.r + (0.009369)*sailStates.de;
	CD = -0.289050;
	CY = (-0.184994)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.071430)*sailStates.p + (-1.423509)*sailStates.q + (0.017655)*sailStates.r + (-0.000301)*sailStates.de;

	Cl = (1.299898)*sailStates.alpha + (0.091643)*sailStates.beta + (-1.472473)*sailStates.p + (12.453607)*sailStates.q + (0.062310)*sailStates.r + (0.000888)*sailStates.de;
	Cm = (-14.112626)*sailStates.alpha + (0.000000)*sailStates.beta + (9.971926)*sailStates.p + (-145.460434)*sailStates.q + (-1.489108)*sailStates.r + (-0.067604)*sailStates.de;
	Cn = (-0.079130)*sailStates.alpha + (-0.022849)*sailStates.beta + (0.552951)*sailStates.p + (-2.852690)*sailStates.q + (-0.061851)*sailStates.r + (0.000331)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end