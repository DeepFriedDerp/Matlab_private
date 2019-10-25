function [aeroForces] = paramSpace_4_1_3_3_1_3_1(sailStates,airStates)

	CL = (4.235936)*sailStates.alpha + (0.371604)*sailStates.beta + (-2.245744)*sailStates.p + (35.310612)*sailStates.q + (1.668719)*sailStates.r + (0.010765)*sailStates.de;
	CD = -0.249090;
	CY = (-0.104050)*sailStates.alpha + (-0.025755)*sailStates.beta + (0.577039)*sailStates.p + (-0.294833)*sailStates.q + (-0.114791)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.339371)*sailStates.alpha + (-0.167316)*sailStates.beta + (-1.002285)*sailStates.p + (9.085252)*sailStates.q + (1.326742)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-12.503245)*sailStates.alpha + (-1.398187)*sailStates.beta + (6.695145)*sailStates.p + (-126.097916)*sailStates.q + (-5.555078)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.273545)*sailStates.alpha + (0.056701)*sailStates.beta + (-1.137504)*sailStates.p + (4.717817)*sailStates.q + (0.001994)*sailStates.r + (0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end