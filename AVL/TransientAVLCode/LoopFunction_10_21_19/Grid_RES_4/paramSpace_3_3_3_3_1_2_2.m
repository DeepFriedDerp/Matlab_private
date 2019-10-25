function [aeroForces] = paramSpace_3_3_3_3_1_2_2(sailStates,airStates)

	CL = (4.080368)*sailStates.alpha + (-0.032917)*sailStates.beta + (-2.561524)*sailStates.p + (35.004795)*sailStates.q + (0.468009)*sailStates.r + (0.011025)*sailStates.de;
	CD = 0.023360;
	CY = (-0.062616)*sailStates.alpha + (-0.024781)*sailStates.beta + (0.163632)*sailStates.p + (-0.498142)*sailStates.q + (-0.010743)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.257127)*sailStates.alpha + (-0.071697)*sailStates.beta + (-1.188533)*sailStates.p + (9.593744)*sailStates.q + (0.345892)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.681369)*sailStates.alpha + (0.127953)*sailStates.beta + (8.697785)*sailStates.p + (-136.960373)*sailStates.q + (-1.589999)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (0.046121)*sailStates.alpha + (0.003893)*sailStates.beta + (-0.279298)*sailStates.p + (1.369791)*sailStates.q + (0.000737)*sailStates.r + (0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end