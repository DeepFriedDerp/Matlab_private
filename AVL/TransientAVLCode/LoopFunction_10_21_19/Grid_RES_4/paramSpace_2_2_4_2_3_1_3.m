function [aeroForces] = paramSpace_2_2_4_2_3_1_3(sailStates,airStates)

	CL = (4.773500)*sailStates.alpha + (-0.102611)*sailStates.beta + (-2.987879)*sailStates.p + (39.452747)*sailStates.q + (-1.582289)*sailStates.r + (0.011531)*sailStates.de;
	CD = -0.593730;
	CY = (0.000708)*sailStates.alpha + (-0.025194)*sailStates.beta + (-0.670563)*sailStates.p + (0.870360)*sailStates.q + (-0.043859)*sailStates.r + (0.000189)*sailStates.de;

	Cl = (1.763909)*sailStates.alpha + (0.265114)*sailStates.beta + (-1.556634)*sailStates.p + (13.368569)*sailStates.q + (-1.344723)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.451050)*sailStates.alpha + (0.363549)*sailStates.beta + (9.792138)*sailStates.p + (-147.878265)*sailStates.q + (5.316952)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.199154)*sailStates.alpha + (0.020234)*sailStates.beta + (1.405435)*sailStates.p + (-6.821032)*sailStates.q + (0.010288)*sailStates.r + (-0.000401)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end