function [aeroForces] = paramSpace_1_4_4_2_1_3_2(sailStates,airStates)

	CL = (4.319071)*sailStates.alpha + (-0.090774)*sailStates.beta + (-2.407460)*sailStates.p + (31.214262)*sailStates.q + (0.250175)*sailStates.r + (0.009900)*sailStates.de;
	CD = -0.445260;
	CY = (-0.085817)*sailStates.alpha + (-0.026957)*sailStates.beta + (0.390430)*sailStates.p + (-0.756269)*sailStates.q + (0.077580)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.290861)*sailStates.alpha + (-0.182446)*sailStates.beta + (-1.097033)*sailStates.p + (8.243669)*sailStates.q + (0.479602)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-15.489196)*sailStates.alpha + (0.458436)*sailStates.beta + (9.051624)*sailStates.p + (-134.899979)*sailStates.q + (-0.771740)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (0.440120)*sailStates.alpha + (-0.022418)*sailStates.beta + (-1.036881)*sailStates.p + (5.724996)*sailStates.q + (-0.067660)*sailStates.r + (0.000281)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end