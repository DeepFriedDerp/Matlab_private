function [aeroForces] = paramSpace_2_2_1_1_1_2_2(sailStates,airStates)

	CL = (5.233099)*sailStates.alpha + (-3.749717)*sailStates.beta + (-3.443125)*sailStates.p + (47.124195)*sailStates.q + (2.075372)*sailStates.r + (0.010452)*sailStates.de;
	CD = -5.746170;
	CY = (1.765288)*sailStates.alpha + (-0.250335)*sailStates.beta + (0.241691)*sailStates.p + (15.675131)*sailStates.q + (-0.022938)*sailStates.r + (0.002984)*sailStates.de;

	Cl = (-5.230117)*sailStates.alpha + (-1.179546)*sailStates.beta + (-1.668113)*sailStates.p + (14.101871)*sailStates.q + (2.322778)*sailStates.r + (0.001223)*sailStates.de;
	Cm = (4.820962)*sailStates.alpha + (16.953066)*sailStates.beta + (10.782928)*sailStates.p + (-151.381348)*sailStates.q + (-7.377218)*sailStates.r + (-0.055279)*sailStates.de;
	Cn = (-1.786114)*sailStates.alpha + (0.350278)*sailStates.beta + (-0.760486)*sailStates.p + (-9.509890)*sailStates.q + (-0.198548)*sailStates.r + (-0.003912)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end