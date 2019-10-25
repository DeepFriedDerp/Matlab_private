function [aeroForces] = paramSpace_13_1_2_1_1_1_2(sailStates,airStates)

	CL = (4.215214)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.885981)*sailStates.p + (35.467266)*sailStates.q + (0.005685)*sailStates.r + (0.010222)*sailStates.de;
	CD = -0.436360;
	CY = (-0.198888)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.198592)*sailStates.p + (-1.304044)*sailStates.q + (0.035064)*sailStates.r + (-0.000280)*sailStates.de;

	Cl = (1.338829)*sailStates.alpha + (0.151318)*sailStates.beta + (-1.537947)*sailStates.p + (12.738682)*sailStates.q + (-0.263059)*sailStates.r + (0.000939)*sailStates.de;
	Cm = (-14.785709)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.397828)*sailStates.p + (-148.140839)*sailStates.q + (-0.045890)*sailStates.r + (-0.069696)*sailStates.de;
	Cn = (0.050039)*sailStates.alpha + (-0.026681)*sailStates.beta + (0.729229)*sailStates.p + (-3.217298)*sailStates.q + (-0.034506)*sailStates.r + (0.000314)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end