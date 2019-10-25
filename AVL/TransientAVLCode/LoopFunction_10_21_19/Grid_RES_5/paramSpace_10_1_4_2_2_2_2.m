function [aeroForces] = paramSpace_10_1_4_2_2_2_2(sailStates,airStates)

	CL = (4.121250)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.800396)*sailStates.p + (37.430172)*sailStates.q + (0.829800)*sailStates.r + (0.011250)*sailStates.de;
	CD = -0.083700;
	CY = (0.071283)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.300013)*sailStates.p + (0.351850)*sailStates.q + (-0.020942)*sailStates.r + (0.000076)*sailStates.de;

	Cl = (1.326135)*sailStates.alpha + (-0.164222)*sailStates.beta + (-1.390406)*sailStates.p + (11.595186)*sailStates.q + (0.719933)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.169038)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.385793)*sailStates.p + (-143.366257)*sailStates.q + (-2.848804)*sailStates.r + (-0.070788)*sailStates.de;
	Cn = (-0.131498)*sailStates.alpha + (0.011484)*sailStates.beta + (-0.582594)*sailStates.p + (1.948963)*sailStates.q + (-0.003160)*sailStates.r + (-0.000068)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end