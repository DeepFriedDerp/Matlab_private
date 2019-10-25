function [aeroForces] = paramSpace_1_3_3_3_3_3_1(sailStates,airStates)

	CL = (3.930179)*sailStates.alpha + (0.015263)*sailStates.beta + (-2.165418)*sailStates.p + (30.872395)*sailStates.q + (-0.345538)*sailStates.r + (0.010097)*sailStates.de;
	CD = -0.056160;
	CY = (0.031217)*sailStates.alpha + (-0.024673)*sailStates.beta + (0.041712)*sailStates.p + (0.294836)*sailStates.q + (0.008308)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.027671)*sailStates.alpha + (-0.026348)*sailStates.beta + (-0.916922)*sailStates.p + (7.136048)*sailStates.q + (-0.069603)*sailStates.r + (-0.000073)*sailStates.de;
	Cm = (-14.547638)*sailStates.alpha + (-0.033113)*sailStates.beta + (7.631304)*sailStates.p + (-127.124184)*sailStates.q + (1.186545)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.173466)*sailStates.alpha + (-0.005329)*sailStates.beta + (-0.248296)*sailStates.p + (1.313963)*sailStates.q + (-0.027015)*sailStates.r + (-0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end