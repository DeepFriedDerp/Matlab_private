function [aeroForces] = paramSpace_3_3_1_3_1_1_2(sailStates,airStates)

	CL = (4.185974)*sailStates.alpha + (0.032377)*sailStates.beta + (-2.544989)*sailStates.p + (34.190769)*sailStates.q + (-0.201978)*sailStates.r + (0.010928)*sailStates.de;
	CD = -0.119270;
	CY = (-0.061525)*sailStates.alpha + (-0.024851)*sailStates.beta + (-0.174632)*sailStates.p + (-0.498142)*sailStates.q + (0.011499)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.219558)*sailStates.alpha + (0.111926)*sailStates.beta + (-1.183390)*sailStates.p + (9.386059)*sailStates.q + (-0.312529)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.994126)*sailStates.alpha + (-0.163271)*sailStates.beta + (8.849372)*sailStates.p + (-136.960373)*sailStates.q + (0.722774)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (-0.079549)*sailStates.alpha + (-0.006766)*sailStates.beta + (0.457231)*sailStates.p + (-1.798882)*sailStates.q + (-0.004788)*sailStates.r + (0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end