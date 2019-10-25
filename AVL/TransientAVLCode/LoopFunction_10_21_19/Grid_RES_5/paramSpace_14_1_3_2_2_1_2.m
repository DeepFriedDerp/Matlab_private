function [aeroForces] = paramSpace_14_1_3_2_2_1_2(sailStates,airStates)

	CL = (3.841156)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.642844)*sailStates.p + (35.037804)*sailStates.q + (0.495861)*sailStates.r + (0.010247)*sailStates.de;
	CD = -0.010100;
	CY = (0.024006)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.042135)*sailStates.p + (0.230435)*sailStates.q + (0.008964)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.274306)*sailStates.alpha + (0.011939)*sailStates.beta + (-1.319569)*sailStates.p + (11.005345)*sailStates.q + (0.216791)*sailStates.r + (0.000633)*sailStates.de;
	Cm = (-14.183299)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.268281)*sailStates.p + (-140.986252)*sailStates.q + (-1.731577)*sailStates.r + (-0.068102)*sailStates.de;
	Cn = (-0.265246)*sailStates.alpha + (-0.002538)*sailStates.beta + (0.340119)*sailStates.p + (-2.677254)*sailStates.q + (-0.058789)*sailStates.r + (-0.000098)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end