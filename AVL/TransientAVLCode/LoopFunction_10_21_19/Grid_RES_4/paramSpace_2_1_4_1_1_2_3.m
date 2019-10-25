function [aeroForces] = paramSpace_2_1_4_1_1_2_3(sailStates,airStates)

	CL = (3.715147)*sailStates.alpha + (0.009213)*sailStates.beta + (-3.449368)*sailStates.p + (41.752090)*sailStates.q + (0.010470)*sailStates.r + (0.011383)*sailStates.de;
	CD = -0.005550;
	CY = (-0.112111)*sailStates.alpha + (-0.023682)*sailStates.beta + (0.185531)*sailStates.p + (-1.471502)*sailStates.q + (0.012005)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (1.470125)*sailStates.alpha + (-0.034175)*sailStates.beta + (-1.981237)*sailStates.p + (16.992119)*sailStates.q + (0.073325)*sailStates.r + (0.001687)*sailStates.de;
	Cm = (-13.509671)*sailStates.alpha + (-0.112597)*sailStates.beta + (11.843637)*sailStates.p + (-161.242615)*sailStates.q + (-0.055000)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (0.088934)*sailStates.alpha + (-0.004350)*sailStates.beta + (-0.471653)*sailStates.p + (3.569500)*sailStates.q + (-0.017659)*sailStates.r + (0.000432)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end