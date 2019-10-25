function [aeroForces] = paramSpace_9_1_1_1_1_2_1(sailStates,airStates)

	CL = (5.153511)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.077734)*sailStates.p + (31.678463)*sailStates.q + (1.666457)*sailStates.r + (0.011051)*sailStates.de;
	CD = -0.939490;
	CY = (-0.279452)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.771939)*sailStates.p + (-0.910011)*sailStates.q + (-0.026861)*sailStates.r + (-0.000195)*sailStates.de;

	Cl = (1.479107)*sailStates.alpha + (-0.349131)*sailStates.beta + (-0.797666)*sailStates.p + (6.142816)*sailStates.q + (1.465215)*sailStates.r + (-0.000335)*sailStates.de;
	Cm = (-14.746301)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.894454)*sailStates.p + (-123.255226)*sailStates.q + (-5.623820)*sailStates.r + (-0.069033)*sailStates.de;
	Cn = (1.036720)*sailStates.alpha + (0.012192)*sailStates.beta + (-1.698026)*sailStates.p + (8.469727)*sailStates.q + (0.008744)*sailStates.r + (0.000400)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end