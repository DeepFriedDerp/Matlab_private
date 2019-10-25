function [aeroForces] = paramSpace_15_1_1_2_2_2_2(sailStates,airStates)

	CL = (3.940131)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.698155)*sailStates.p + (39.482777)*sailStates.q + (1.754843)*sailStates.r + (0.011146)*sailStates.de;
	CD = -0.058370;
	CY = (0.070684)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.466230)*sailStates.p + (0.199288)*sailStates.q + (-0.116266)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.238819)*sailStates.alpha + (-0.240950)*sailStates.beta + (-1.328641)*sailStates.p + (12.221251)*sailStates.q + (1.308927)*sailStates.r + (0.000628)*sailStates.de;
	Cm = (-12.430296)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.207347)*sailStates.p + (-139.959488)*sailStates.q + (-5.784458)*sailStates.r + (-0.067023)*sailStates.de;
	Cn = (-0.301963)*sailStates.alpha + (0.060075)*sailStates.beta + (-0.810267)*sailStates.p + (2.474896)*sailStates.q + (-0.041982)*sailStates.r + (0.000037)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end