function [aeroForces] = paramSpace_1_3_4_3_2_3_3(sailStates,airStates)

	CL = (3.978278)*sailStates.alpha + (0.011663)*sailStates.beta + (-2.682095)*sailStates.p + (35.016457)*sailStates.q + (-0.412581)*sailStates.r + (0.010431)*sailStates.de;
	CD = -0.080070;
	CY = (0.031715)*sailStates.alpha + (-0.024789)*sailStates.beta + (0.072212)*sailStates.p + (0.194782)*sailStates.q + (0.014385)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.276090)*sailStates.alpha + (-0.034405)*sailStates.beta + (-1.337866)*sailStates.p + (11.071728)*sailStates.q + (-0.107870)*sailStates.r + (0.000622)*sailStates.de;
	Cm = (-14.715598)*sailStates.alpha + (-0.000257)*sailStates.beta + (9.428793)*sailStates.p + (-141.871536)*sailStates.q + (1.398440)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (0.187610)*sailStates.alpha + (-0.006638)*sailStates.beta + (-0.387085)*sailStates.p + (2.337014)*sailStates.q + (-0.045877)*sailStates.r + (-0.000043)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end