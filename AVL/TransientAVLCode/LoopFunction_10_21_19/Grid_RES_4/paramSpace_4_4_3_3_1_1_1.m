function [aeroForces] = paramSpace_4_4_3_3_1_1_1(sailStates,airStates)

	CL = (3.825560)*sailStates.alpha + (-0.064391)*sailStates.beta + (-2.145924)*sailStates.p + (30.652063)*sailStates.q + (0.346005)*sailStates.r + (0.009854)*sailStates.de;
	CD = -0.037500;
	CY = (-0.032346)*sailStates.alpha + (-0.023817)*sailStates.beta + (-0.029069)*sailStates.p + (-0.294836)*sailStates.q + (0.005772)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (0.959992)*sailStates.alpha + (0.009014)*sailStates.beta + (-0.876330)*sailStates.p + (6.667420)*sailStates.q + (0.081341)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-14.135190)*sailStates.alpha + (0.224837)*sailStates.beta + (7.559973)*sailStates.p + (-126.097916)*sailStates.q + (-1.207288)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (-0.160354)*sailStates.alpha + (-0.002091)*sailStates.beta + (0.222805)*sailStates.p + (-1.229273)*sailStates.q + (-0.025827)*sailStates.r + (0.000056)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end