function [aeroForces] = paramSpace_3_3_1_3_1_2_2(sailStates,airStates)

	CL = (4.099433)*sailStates.alpha + (-0.018428)*sailStates.beta + (-2.562016)*sailStates.p + (34.971649)*sailStates.q + (0.450497)*sailStates.r + (0.011086)*sailStates.de;
	CD = 0.022570;
	CY = (-0.062612)*sailStates.alpha + (-0.024851)*sailStates.beta + (0.133697)*sailStates.p + (-0.498142)*sailStates.q + (-0.008710)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.252609)*sailStates.alpha + (-0.056319)*sailStates.beta + (-1.188776)*sailStates.p + (9.592227)*sailStates.q + (0.297980)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.813677)*sailStates.alpha + (0.036197)*sailStates.beta + (8.704407)*sailStates.p + (-136.960373)*sailStates.q + (-1.488964)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (0.048165)*sailStates.alpha + (0.003017)*sailStates.beta + (-0.235095)*sailStates.p + (1.346626)*sailStates.q + (0.000626)*sailStates.r + (0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end