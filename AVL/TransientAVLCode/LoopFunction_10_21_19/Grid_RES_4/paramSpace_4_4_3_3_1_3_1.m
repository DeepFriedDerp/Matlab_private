function [aeroForces] = paramSpace_4_4_3_3_1_3_1(sailStates,airStates)

	CL = (4.235936)*sailStates.alpha + (-0.371604)*sailStates.beta + (-2.245744)*sailStates.p + (35.310612)*sailStates.q + (1.668719)*sailStates.r + (0.010765)*sailStates.de;
	CD = -0.249090;
	CY = (-0.104050)*sailStates.alpha + (-0.023817)*sailStates.beta + (0.577039)*sailStates.p + (-0.294833)*sailStates.q + (-0.114791)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.198403)*sailStates.alpha + (-0.377659)*sailStates.beta + (-0.907912)*sailStates.p + (7.897369)*sailStates.q + (1.307927)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-12.503245)*sailStates.alpha + (1.398186)*sailStates.beta + (6.695145)*sailStates.p + (-126.097916)*sailStates.q + (-5.555078)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.376705)*sailStates.alpha + (0.051701)*sailStates.beta + (-1.156276)*sailStates.p + (4.954102)*sailStates.q + (0.005736)*sailStates.r + (0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end