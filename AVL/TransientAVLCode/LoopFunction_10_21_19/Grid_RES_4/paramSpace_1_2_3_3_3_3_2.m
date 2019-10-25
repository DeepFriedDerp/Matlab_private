function [aeroForces] = paramSpace_1_2_3_3_3_3_2(sailStates,airStates)

	CL = (3.955244)*sailStates.alpha + (-0.019877)*sailStates.beta + (-2.416134)*sailStates.p + (33.009171)*sailStates.q + (-0.446212)*sailStates.r + (0.010215)*sailStates.de;
	CD = -0.047160;
	CY = (0.059920)*sailStates.alpha + (-0.025480)*sailStates.beta + (0.010792)*sailStates.p + (0.489619)*sailStates.q + (0.002164)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.218358)*sailStates.alpha + (-0.034552)*sailStates.beta + (-1.154249)*sailStates.p + (9.514718)*sailStates.q + (-0.158322)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-14.587544)*sailStates.alpha + (0.048567)*sailStates.beta + (8.441095)*sailStates.p + (-134.148560)*sailStates.q + (1.520626)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (0.155774)*sailStates.alpha + (-0.006291)*sailStates.beta + (-0.230964)*sailStates.p + (1.341872)*sailStates.q + (-0.031836)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end