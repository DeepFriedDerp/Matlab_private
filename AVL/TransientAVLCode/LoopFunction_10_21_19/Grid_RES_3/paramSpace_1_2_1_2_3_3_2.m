function [aeroForces] = paramSpace_1_2_1_2_3_3_2(sailStates,airStates)

	CL = (4.062215)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.412887)*sailStates.p + (32.205238)*sailStates.q + (-0.067483)*sailStates.r + (0.010003)*sailStates.de;
	CD = -0.204820;
	CY = (0.091254)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.131691)*sailStates.p + (0.759371)*sailStates.q + (0.023149)*sailStates.r + (0.000162)*sailStates.de;

	Cl = (1.200306)*sailStates.alpha + (-0.096130)*sailStates.beta + (-1.139973)*sailStates.p + (9.079407)*sailStates.q + (0.151396)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-14.718271)*sailStates.alpha + (0.000000)*sailStates.beta + (8.668637)*sailStates.p + (-134.568695)*sailStates.q + (0.290162)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.170712)*sailStates.alpha + (-0.016950)*sailStates.beta + (-0.510424)*sailStates.p + (2.454520)*sailStates.q + (-0.027929)*sailStates.r + (-0.000156)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end