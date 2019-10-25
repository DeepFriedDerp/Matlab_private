function [aeroForces] = paramSpace_2_1_4_2_2_1_1(sailStates,airStates)

	CL = (4.231819)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.296496)*sailStates.p + (35.638180)*sailStates.q + (-1.597816)*sailStates.r + (0.011034)*sailStates.de;
	CD = -0.159020;
	CY = (0.077189)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.499546)*sailStates.p + (0.230436)*sailStates.q + (-0.106157)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.252673)*sailStates.alpha + (0.240641)*sailStates.beta + (-0.995476)*sailStates.p + (8.861572)*sailStates.q + (-1.203632)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-13.103768)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.920531)*sailStates.p + (-128.239044)*sailStates.q + (5.275707)*sailStates.r + (-0.066831)*sailStates.de;
	Cn = (-0.216124)*sailStates.alpha + (0.051150)*sailStates.beta + (0.978257)*sailStates.p + (-4.114708)*sailStates.q + (-0.003235)*sailStates.r + (-0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end