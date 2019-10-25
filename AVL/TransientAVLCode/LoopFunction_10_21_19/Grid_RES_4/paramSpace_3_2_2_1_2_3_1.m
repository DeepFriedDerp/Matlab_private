function [aeroForces] = paramSpace_3_2_2_1_2_3_1(sailStates,airStates)

	CL = (6.183712)*sailStates.alpha + (0.187502)*sailStates.beta + (-1.740023)*sailStates.p + (30.452238)*sailStates.q + (2.435749)*sailStates.r + (0.011191)*sailStates.de;
	CD = -2.306570;
	CY = (-0.368249)*sailStates.alpha + (-0.024905)*sailStates.beta + (1.082340)*sailStates.p + (0.221994)*sailStates.q + (-0.070948)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.289622)*sailStates.alpha + (-0.497473)*sailStates.beta + (-0.520043)*sailStates.p + (3.983829)*sailStates.q + (2.202366)*sailStates.r + (-0.000761)*sailStates.de;
	Cm = (-12.569595)*sailStates.alpha + (-0.723124)*sailStates.beta + (5.310920)*sailStates.p + (-112.898659)*sailStates.q + (-8.252482)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (1.990566)*sailStates.alpha + (0.037074)*sailStates.beta + (-2.421245)*sailStates.p + (10.865669)*sailStates.q + (0.016593)*sailStates.r + (0.000105)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end