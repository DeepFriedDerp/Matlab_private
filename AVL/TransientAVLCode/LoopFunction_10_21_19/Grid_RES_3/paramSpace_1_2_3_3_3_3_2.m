function [aeroForces] = paramSpace_1_2_3_3_3_3_2(sailStates,airStates)

	CL = (4.041706)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.445981)*sailStates.p + (33.183212)*sailStates.q + (-0.336400)*sailStates.r + (0.010441)*sailStates.de;
	CD = -0.071070;
	CY = (0.060246)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.046984)*sailStates.p + (0.491627)*sailStates.q + (0.008331)*sailStates.r + (0.000105)*sailStates.de;

	Cl = (1.207170)*sailStates.alpha + (-0.043107)*sailStates.beta + (-1.152923)*sailStates.p + (9.360850)*sailStates.q + (-0.063992)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-14.888753)*sailStates.alpha + (0.000000)*sailStates.beta + (8.562952)*sailStates.p + (-134.907364)*sailStates.q + (1.128148)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (0.140376)*sailStates.alpha + (-0.007601)*sailStates.beta + (-0.281073)*sailStates.p + (1.395248)*sailStates.q + (-0.025326)*sailStates.r + (-0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end