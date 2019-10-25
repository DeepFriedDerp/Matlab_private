function [aeroForces] = paramSpace_9_1_3_1_1_2_1(sailStates,airStates)

	CL = (5.181403)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.077522)*sailStates.p + (31.696049)*sailStates.q + (1.682444)*sailStates.r + (0.011018)*sailStates.de;
	CD = -0.975950;
	CY = (-0.285756)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.801720)*sailStates.p + (-0.910010)*sailStates.q + (-0.028029)*sailStates.r + (-0.000195)*sailStates.de;

	Cl = (1.490344)*sailStates.alpha + (-0.364023)*sailStates.beta + (-0.797553)*sailStates.p + (6.143636)*sailStates.q + (1.512367)*sailStates.r + (-0.000335)*sailStates.de;
	Cm = (-14.682256)*sailStates.alpha + (0.000000)*sailStates.beta + (6.891266)*sailStates.p + (-123.255226)*sailStates.q + (-5.715127)*sailStates.r + (-0.069033)*sailStates.de;
	Cn = (1.053208)*sailStates.alpha + (0.012712)*sailStates.beta + (-1.741934)*sailStates.p + (8.493221)*sailStates.q + (0.008988)*sailStates.r + (0.000387)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end