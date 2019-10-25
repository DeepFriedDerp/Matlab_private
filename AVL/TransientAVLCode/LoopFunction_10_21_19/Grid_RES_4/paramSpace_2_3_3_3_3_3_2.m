function [aeroForces] = paramSpace_2_3_3_3_3_3_2(sailStates,airStates)

	CL = (4.171513)*sailStates.alpha + (-0.025137)*sailStates.beta + (-2.544743)*sailStates.p + (34.207352)*sailStates.q + (0.193225)*sailStates.r + (0.010898)*sailStates.de;
	CD = -0.113940;
	CY = (0.061527)*sailStates.alpha + (-0.024816)*sailStates.beta + (0.159665)*sailStates.p + (0.498142)*sailStates.q + (0.010483)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.221507)*sailStates.alpha + (-0.104238)*sailStates.beta + (-1.183268)*sailStates.p + (9.386818)*sailStates.q + (0.288564)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.927973)*sailStates.alpha + (0.117393)*sailStates.beta + (8.846061)*sailStates.p + (-136.960373)*sailStates.q + (-0.672256)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (0.080528)*sailStates.alpha + (-0.006317)*sailStates.beta + (-0.435138)*sailStates.p + (1.787300)*sailStates.q + (-0.004591)*sailStates.r + (-0.000111)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end