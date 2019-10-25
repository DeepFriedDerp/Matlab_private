function [aeroForces] = paramSpace_7_1_3_1_2_1_2(sailStates,airStates)

	CL = (5.160137)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.101687)*sailStates.p + (39.946098)*sailStates.q + (-1.745198)*sailStates.r + (0.011531)*sailStates.de;
	CD = -0.969450;
	CY = (-0.036924)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.808821)*sailStates.p + (1.046668)*sailStates.q + (-0.028208)*sailStates.r + (0.000228)*sailStates.de;

	Cl = (1.946431)*sailStates.alpha + (0.362040)*sailStates.beta + (-1.633789)*sailStates.p + (13.876781)*sailStates.q + (-1.546756)*sailStates.r + (0.001016)*sailStates.de;
	Cm = (-14.684279)*sailStates.alpha + (0.000000)*sailStates.beta + (10.321233)*sailStates.p + (-151.326889)*sailStates.q + (5.904134)*sailStates.r + (-0.071886)*sailStates.de;
	Cn = (0.317674)*sailStates.alpha + (0.012643)*sailStates.beta + (1.735888)*sailStates.p + (-8.518067)*sailStates.q + (0.008529)*sailStates.r + (-0.000471)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end