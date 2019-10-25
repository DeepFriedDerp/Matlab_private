function [aeroForces] = paramSpace_1_2_2_1_2_3_1(sailStates,airStates)

	CL = (5.549953)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.490999)*sailStates.p + (20.940096)*sailStates.q + (1.670402)*sailStates.r + (0.008976)*sailStates.de;
	CD = -2.098020;
	CY = (-0.413463)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.931983)*sailStates.p + (-0.589408)*sailStates.q + (0.164334)*sailStates.r + (-0.000124)*sailStates.de;

	Cl = (1.040190)*sailStates.alpha + (-0.442480)*sailStates.beta + (-0.421666)*sailStates.p + (1.294156)*sailStates.q + (1.732120)*sailStates.r + (-0.000783)*sailStates.de;
	Cm = (-16.241180)*sailStates.alpha + (0.000000)*sailStates.beta + (6.827815)*sailStates.p + (-111.551048)*sailStates.q + (-5.487453)*sailStates.r + (-0.066175)*sailStates.de;
	Cn = (1.996493)*sailStates.alpha + (-0.078021)*sailStates.beta + (-2.147716)*sailStates.p + (10.117565)*sailStates.q + (-0.060171)*sailStates.r + (0.000322)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end