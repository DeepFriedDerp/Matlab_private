function [aeroForces] = paramSpace_3_3_1_2_1_3_3(sailStates,airStates)

	CL = (4.773500)*sailStates.alpha + (-0.102611)*sailStates.beta + (-2.987879)*sailStates.p + (39.452747)*sailStates.q + (1.582289)*sailStates.r + (0.011531)*sailStates.de;
	CD = -0.593730;
	CY = (-0.000708)*sailStates.alpha + (-0.024758)*sailStates.beta + (0.670563)*sailStates.p + (-0.870360)*sailStates.q + (-0.043859)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.720497)*sailStates.alpha + (-0.334414)*sailStates.beta + (-1.523983)*sailStates.p + (12.964686)*sailStates.q + (1.342625)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.451052)*sailStates.alpha + (0.363549)*sailStates.beta + (9.792139)*sailStates.p + (-147.878265)*sailStates.q + (-5.316954)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.170015)*sailStates.alpha + (0.019061)*sailStates.beta + (-1.407575)*sailStates.p + (6.847505)*sailStates.q + (0.010425)*sailStates.r + (0.000401)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end