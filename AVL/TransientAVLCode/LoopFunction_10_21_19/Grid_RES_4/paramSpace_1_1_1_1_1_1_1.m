function [aeroForces] = paramSpace_1_1_1_1_1_1_1(sailStates,airStates)

	CL = (5.241805)*sailStates.alpha + (-0.651518)*sailStates.beta + (-1.827379)*sailStates.p + (35.478260)*sailStates.q + (-2.473034)*sailStates.r + (0.011509)*sailStates.de;
	CD = -1.823040;
	CY = (0.016028)*sailStates.alpha + (-0.016657)*sailStates.beta + (-0.903556)*sailStates.p + (-2.326709)*sailStates.q + (-0.179479)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (0.595540)*sailStates.alpha + (0.388246)*sailStates.beta + (-0.585823)*sailStates.p + (5.699195)*sailStates.q + (-2.173487)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-8.047688)*sailStates.alpha + (2.573739)*sailStates.beta + (4.442409)*sailStates.p + (-112.315697)*sailStates.q + (8.237137)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-1.329025)*sailStates.alpha + (0.107216)*sailStates.beta + (2.038532)*sailStates.p + (-7.142163)*sailStates.q + (-0.004398)*sailStates.r + (0.000522)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end