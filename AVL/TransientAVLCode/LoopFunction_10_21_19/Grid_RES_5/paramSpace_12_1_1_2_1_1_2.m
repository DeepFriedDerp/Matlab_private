function [aeroForces] = paramSpace_12_1_1_2_1_1_2(sailStates,airStates)

	CL = (4.052678)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.703474)*sailStates.p + (35.514652)*sailStates.q + (0.318744)*sailStates.r + (0.010805)*sailStates.de;
	CD = -0.040360;
	CY = (-0.067106)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.030656)*sailStates.p + (-0.520428)*sailStates.q + (0.004364)*sailStates.r + (-0.000112)*sailStates.de;

	Cl = (1.308092)*sailStates.alpha + (0.036207)*sailStates.beta + (-1.347047)*sailStates.p + (11.127224)*sailStates.q + (0.080956)*sailStates.r + (0.000599)*sailStates.de;
	Cm = (-14.849870)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.361647)*sailStates.p + (-141.704483)*sailStates.q + (-1.050212)*sailStates.r + (-0.069692)*sailStates.de;
	Cn = (-0.092250)*sailStates.alpha + (-0.005089)*sailStates.beta + (0.234253)*sailStates.p + (-1.147168)*sailStates.q + (-0.018090)*sailStates.r + (0.000148)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end