function [aeroForces] = paramSpace_2_2_3_3_3_3_2(sailStates,airStates)

	CL = (4.171513)*sailStates.alpha + (0.025137)*sailStates.beta + (-2.544742)*sailStates.p + (34.207352)*sailStates.q + (0.193225)*sailStates.r + (0.010898)*sailStates.de;
	CD = -0.113940;
	CY = (0.061527)*sailStates.alpha + (-0.025136)*sailStates.beta + (0.159665)*sailStates.p + (0.498142)*sailStates.q + (0.010483)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.272534)*sailStates.alpha + (-0.095636)*sailStates.beta + (-1.215917)*sailStates.p + (9.790698)*sailStates.q + (0.286438)*sailStates.r + (0.000376)*sailStates.de;
	Cm = (-14.927973)*sailStates.alpha + (-0.117393)*sailStates.beta + (8.846061)*sailStates.p + (-136.960373)*sailStates.q + (-0.672256)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (0.075114)*sailStates.alpha + (-0.006783)*sailStates.beta + (-0.437278)*sailStates.p + (1.813771)*sailStates.q + (-0.004730)*sailStates.r + (-0.000111)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end