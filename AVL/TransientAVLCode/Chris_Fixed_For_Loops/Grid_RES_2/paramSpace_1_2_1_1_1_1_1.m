function [aeroForces] = paramSpace_1_2_1_1_1_1_1(sailStates,airStates)

	CL = (5.171909)*sailStates.alpha + (-0.699873)*sailStates.beta + (-5.697986)*sailStates.p + (53.268291)*sailStates.q + (2.186957)*sailStates.r + (0.010898)*sailStates.de;
	CD = -6.614230;
	CY = (2.253829)*sailStates.alpha + (-0.018256)*sailStates.beta + (1.261334)*sailStates.p + (3.819810)*sailStates.q + (0.166599)*sailStates.r + (0.000862)*sailStates.de;

	Cl = (-0.737916)*sailStates.alpha + (-0.903443)*sailStates.beta + (-3.856364)*sailStates.p + (33.056358)*sailStates.q + (2.401737)*sailStates.r + (0.004897)*sailStates.de;
	Cm = (2.868603)*sailStates.alpha + (2.973944)*sailStates.beta + (21.252726)*sailStates.p + (-228.564499)*sailStates.q + (-7.421898)*sailStates.r + (-0.080608)*sailStates.de;
	Cn = (-8.192708)*sailStates.alpha + (-0.091095)*sailStates.beta + (-3.434292)*sailStates.p + (14.675756)*sailStates.q + (-0.070737)*sailStates.r + (-0.000716)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end