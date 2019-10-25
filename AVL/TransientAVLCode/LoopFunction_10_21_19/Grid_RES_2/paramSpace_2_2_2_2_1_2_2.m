function [aeroForces] = paramSpace_2_2_2_2_1_2_2(sailStates,airStates)

	CL = (4.214331)*sailStates.alpha + (-0.205231)*sailStates.beta + (-2.756867)*sailStates.p + (38.090046)*sailStates.q + (1.371438)*sailStates.r + (0.011124)*sailStates.de;
	CD = -0.162020;
	CY = (-0.022068)*sailStates.alpha + (-0.024102)*sailStates.beta + (0.498894)*sailStates.p + (-0.513811)*sailStates.q + (-0.065717)*sailStates.r + (-0.000110)*sailStates.de;

	Cl = (1.405645)*sailStates.alpha + (-0.288102)*sailStates.beta + (-1.331618)*sailStates.p + (11.382561)*sailStates.q + (1.108641)*sailStates.r + (0.000512)*sailStates.de;
	Cm = (-13.648640)*sailStates.alpha + (0.800281)*sailStates.beta + (8.869371)*sailStates.p + (-141.379639)*sailStates.q + (-4.629135)*sailStates.r + (-0.069332)*sailStates.de;
	Cn = (-0.072053)*sailStates.alpha + (0.029002)*sailStates.beta + (-0.947137)*sailStates.p + (4.040796)*sailStates.q + (0.001736)*sailStates.r + (0.000216)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end