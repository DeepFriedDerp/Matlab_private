function [aeroForces] = paramSpace_1_2_2_3_3_1_3(sailStates,airStates)

	CL = (4.291100)*sailStates.alpha + (-0.134041)*sailStates.beta + (-2.765905)*sailStates.p + (39.853306)*sailStates.q + (-1.878387)*sailStates.r + (0.011177)*sailStates.de;
	CD = -0.251720;
	CY = (0.021617)*sailStates.alpha + (-0.025728)*sailStates.beta + (-0.640751)*sailStates.p + (0.684404)*sailStates.q + (-0.127478)*sailStates.r + (0.000146)*sailStates.de;

	Cl = (1.540505)*sailStates.alpha + (0.250908)*sailStates.beta + (-1.391236)*sailStates.p + (12.728588)*sailStates.q + (-1.491094)*sailStates.r + (0.000675)*sailStates.de;
	Cm = (-12.794692)*sailStates.alpha + (0.500669)*sailStates.beta + (8.375890)*sailStates.p + (-141.172913)*sailStates.q + (6.253620)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (0.225627)*sailStates.alpha + (0.058788)*sailStates.beta + (1.193602)*sailStates.p + (-4.903693)*sailStates.q + (-0.004130)*sailStates.r + (-0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end