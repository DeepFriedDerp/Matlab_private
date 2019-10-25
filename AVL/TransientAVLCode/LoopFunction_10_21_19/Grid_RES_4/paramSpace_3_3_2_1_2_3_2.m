function [aeroForces] = paramSpace_3_3_2_1_2_3_2(sailStates,airStates)

	CL = (6.487246)*sailStates.alpha + (-0.192759)*sailStates.beta + (-2.624764)*sailStates.p + (37.619930)*sailStates.q + (2.551171)*sailStates.r + (0.011592)*sailStates.de;
	CD = -2.325960;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (1.118113)*sailStates.p + (0.000000)*sailStates.q + (-0.073285)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.891673)*sailStates.alpha + (-0.614002)*sailStates.beta + (-1.210116)*sailStates.p + (10.286368)*sailStates.q + (2.294675)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-13.705806)*sailStates.alpha + (0.740774)*sailStates.beta + (8.264622)*sailStates.p + (-137.194580)*sailStates.q + (-8.636930)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.345620)*sailStates.alpha + (0.035599)*sailStates.beta + (-2.449454)*sailStates.p + (10.951406)*sailStates.q + (0.015343)*sailStates.r + (0.000213)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end