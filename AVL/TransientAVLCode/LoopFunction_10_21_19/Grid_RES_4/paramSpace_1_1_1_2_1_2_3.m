function [aeroForces] = paramSpace_1_1_1_2_1_2_3(sailStates,airStates)

	CL = (3.593103)*sailStates.alpha + (-0.229483)*sailStates.beta + (-2.869812)*sailStates.p + (38.264568)*sailStates.q + (-0.954698)*sailStates.r + (0.010543)*sailStates.de;
	CD = 0.113550;
	CY = (-0.086070)*sailStates.alpha + (-0.023196)*sailStates.beta + (-0.169369)*sailStates.p + (-0.455226)*sailStates.q + (-0.033641)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.290034)*sailStates.alpha + (0.032733)*sailStates.beta + (-1.532756)*sailStates.p + (13.452024)*sailStates.q + (-0.685821)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-12.878804)*sailStates.alpha + (0.917720)*sailStates.beta + (9.603732)*sailStates.p + (-145.756378)*sailStates.q + (3.260995)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.373402)*sailStates.alpha + (0.012320)*sailStates.beta + (0.112535)*sailStates.p + (1.067839)*sailStates.q + (-0.053737)*sailStates.r + (0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end