function [aeroForces] = paramSpace_1_2_3_3_1_3_3(sailStates,airStates)

	CL = (4.072546)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.724919)*sailStates.p + (35.168972)*sailStates.q + (-0.172867)*sailStates.r + (0.010572)*sailStates.de;
	CD = -0.135020;
	CY = (-0.018646)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.176327)*sailStates.p + (-0.318253)*sailStates.q + (0.031061)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.356251)*sailStates.alpha + (-0.075466)*sailStates.beta + (-1.376455)*sailStates.p + (11.294854)*sailStates.q + (0.070075)*sailStates.r + (0.000702)*sailStates.de;
	Cm = (-14.932014)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.686739)*sailStates.p + (-143.204193)*sailStates.q + (0.600510)*sailStates.r + (-0.069165)*sailStates.de;
	Cn = (0.223553)*sailStates.alpha + (-0.013307)*sailStates.beta + (-0.589215)*sailStates.p + (3.579723)*sailStates.q + (-0.048958)*sailStates.r + (0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end