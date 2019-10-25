function [aeroForces] = paramSpace_1_1_2_2_1_2_1(sailStates,airStates)

	CL = (4.091232)*sailStates.alpha + (0.020622)*sailStates.beta + (-2.296383)*sailStates.p + (31.884268)*sailStates.q + (0.047631)*sailStates.r + (0.010530)*sailStates.de;
	CD = -0.102050;
	CY = (-0.080053)*sailStates.alpha + (-0.024246)*sailStates.beta + (0.199793)*sailStates.p + (-0.513811)*sailStates.q + (0.026267)*sailStates.r + (-0.000109)*sailStates.de;

	Cl = (1.218591)*sailStates.alpha + (-0.076152)*sailStates.beta + (-1.043566)*sailStates.p + (8.225271)*sailStates.q + (0.200577)*sailStates.r + (0.000165)*sailStates.de;
	Cm = (-14.960902)*sailStates.alpha + (-0.132325)*sailStates.beta + (8.152617)*sailStates.p + (-130.467148)*sailStates.q + (-0.155248)*sailStates.r + (-0.068233)*sailStates.de;
	Cn = (0.315283)*sailStates.alpha + (-0.013065)*sailStates.beta + (-0.539402)*sailStates.p + (3.122543)*sailStates.q + (-0.026609)*sailStates.r + (0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end