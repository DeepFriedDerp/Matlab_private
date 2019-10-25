function [aeroForces] = paramSpace_1_3_1_3_1_2_2(sailStates,airStates)

	CL = (3.765070)*sailStates.alpha + (0.073208)*sailStates.beta + (-2.493543)*sailStates.p + (35.274403)*sailStates.q + (-0.873744)*sailStates.r + (0.010506)*sailStates.de;
	CD = 0.102230;
	CY = (-0.061496)*sailStates.alpha + (-0.025548)*sailStates.beta + (-0.165595)*sailStates.p + (-0.489618)*sailStates.q + (-0.032886)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.138463)*sailStates.alpha + (0.120809)*sailStates.beta + (-1.155792)*sailStates.p + (9.686151)*sailStates.q + (-0.606517)*sailStates.r + (0.000322)*sailStates.de;
	Cm = (-13.404624)*sailStates.alpha + (-0.294915)*sailStates.beta + (8.324511)*sailStates.p + (-135.545776)*sailStates.q + (2.982995)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (0.191698)*sailStates.alpha + (0.022157)*sailStates.beta + (0.180228)*sailStates.p + (0.376912)*sailStates.q + (-0.039415)*sailStates.r + (0.000140)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end