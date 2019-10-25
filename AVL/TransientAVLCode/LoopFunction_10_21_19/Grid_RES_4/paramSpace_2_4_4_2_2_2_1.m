function [aeroForces] = paramSpace_2_4_4_2_2_2_1(sailStates,airStates)

	CL = (3.951221)*sailStates.alpha + (0.029858)*sailStates.beta + (-2.145235)*sailStates.p + (31.419727)*sailStates.q + (-0.266088)*sailStates.r + (0.010732)*sailStates.de;
	CD = 0.030530;
	CY = (-0.006409)*sailStates.alpha + (-0.024862)*sailStates.beta + (-0.036594)*sailStates.p + (-0.100924)*sailStates.q + (-0.002409)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (0.923157)*sailStates.alpha + (0.037927)*sailStates.beta + (-0.821597)*sailStates.p + (6.057831)*sailStates.q + (-0.145550)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-14.403042)*sailStates.alpha + (-0.023465)*sailStates.beta + (7.351850)*sailStates.p + (-125.105080)*sailStates.q + (0.875640)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (-0.001922)*sailStates.alpha + (0.001718)*sailStates.beta + (0.059618)*sailStates.p + (-0.225793)*sailStates.q + (-0.002361)*sailStates.r + (0.000013)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end