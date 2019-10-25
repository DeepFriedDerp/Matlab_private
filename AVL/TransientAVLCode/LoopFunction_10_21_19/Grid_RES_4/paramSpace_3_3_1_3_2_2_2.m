function [aeroForces] = paramSpace_3_3_1_3_2_2_2(sailStates,airStates)

	CL = (4.070755)*sailStates.alpha + (-0.012398)*sailStates.beta + (-2.567031)*sailStates.p + (34.944130)*sailStates.q + (0.320361)*sailStates.r + (0.011087)*sailStates.de;
	CD = 0.031510;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.053154)*sailStates.p + (-0.000000)*sailStates.q + (-0.003484)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.230947)*sailStates.alpha + (-0.033365)*sailStates.beta + (-1.191896)*sailStates.p + (9.583526)*sailStates.q + (0.191681)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-14.794406)*sailStates.alpha + (0.015617)*sailStates.beta + (8.761602)*sailStates.p + (-137.194580)*sailStates.q + (-1.054464)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.036656)*sailStates.alpha + (0.001859)*sailStates.beta + (-0.069701)*sailStates.p + (0.228095)*sailStates.q + (-0.003156)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end