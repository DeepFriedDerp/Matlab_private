function [aeroForces] = paramSpace_4_2_2_3_1_1_1(sailStates,airStates)

	CL = (3.930179)*sailStates.alpha + (0.015263)*sailStates.beta + (-2.165418)*sailStates.p + (30.872395)*sailStates.q + (0.345538)*sailStates.r + (0.010097)*sailStates.de;
	CD = -0.056160;
	CY = (-0.031217)*sailStates.alpha + (-0.025280)*sailStates.beta + (-0.041712)*sailStates.p + (-0.294836)*sailStates.q + (0.008308)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.080643)*sailStates.alpha + (0.039139)*sailStates.beta + (-0.948465)*sailStates.p + (7.533014)*sailStates.q + (0.075863)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-14.547638)*sailStates.alpha + (-0.033113)*sailStates.beta + (7.631304)*sailStates.p + (-127.124184)*sailStates.q + (-1.186545)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (-0.181048)*sailStates.alpha + (-0.007697)*sailStates.beta + (0.254571)*sailStates.p + (-1.392925)*sailStates.q + (-0.028261)*sailStates.r + (0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end