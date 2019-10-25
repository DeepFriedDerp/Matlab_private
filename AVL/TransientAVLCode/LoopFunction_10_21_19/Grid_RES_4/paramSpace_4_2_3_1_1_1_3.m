function [aeroForces] = paramSpace_4_2_3_1_1_1_3(sailStates,airStates)

	CL = (4.787408)*sailStates.alpha + (-0.066954)*sailStates.beta + (-3.112824)*sailStates.p + (34.913406)*sailStates.q + (-0.491914)*sailStates.r + (0.009437)*sailStates.de;
	CD = -1.443240;
	CY = (-0.427310)*sailStates.alpha + (-0.027531)*sailStates.beta + (-0.433289)*sailStates.p + (-2.326707)*sailStates.q + (0.086103)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (1.321696)*sailStates.alpha + (0.301639)*sailStates.beta + (-1.793838)*sailStates.p + (14.835914)*sailStates.q + (-0.765422)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-14.280692)*sailStates.alpha + (0.279367)*sailStates.beta + (11.820590)*sailStates.p + (-156.352325)*sailStates.q + (1.544626)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (0.569252)*sailStates.alpha + (-0.063801)*sailStates.beta + (1.393358)*sailStates.p + (-5.920816)*sailStates.q + (-0.053800)*sailStates.r + (0.000521)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end