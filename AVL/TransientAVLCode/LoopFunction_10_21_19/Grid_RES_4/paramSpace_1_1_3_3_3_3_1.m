function [aeroForces] = paramSpace_1_1_3_3_3_3_1(sailStates,airStates)

	CL = (3.871524)*sailStates.alpha + (-0.044186)*sailStates.beta + (-2.146540)*sailStates.p + (30.604059)*sailStates.q + (-0.338063)*sailStates.r + (0.009940)*sailStates.de;
	CD = -0.057010;
	CY = (0.030749)*sailStates.alpha + (-0.025694)*sailStates.beta + (0.043344)*sailStates.p + (0.294836)*sailStates.q + (0.008632)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.115484)*sailStates.alpha + (-0.053584)*sailStates.beta + (-0.971035)*sailStates.p + (7.853081)*sailStates.q + (-0.077033)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-14.331460)*sailStates.alpha + (0.093953)*sailStates.beta + (7.569079)*sailStates.p + (-126.097916)*sailStates.q + (1.161510)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.187127)*sailStates.alpha + (-0.010468)*sailStates.beta + (-0.263086)*sailStates.p + (1.476725)*sailStates.q + (-0.029294)*sailStates.r + (-0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end