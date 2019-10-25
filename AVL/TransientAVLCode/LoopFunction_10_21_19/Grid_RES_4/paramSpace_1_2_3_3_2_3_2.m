function [aeroForces] = paramSpace_1_2_3_3_2_3_2(sailStates,airStates)

	CL = (3.974409)*sailStates.alpha + (-0.014051)*sailStates.beta + (-2.430585)*sailStates.p + (32.928516)*sailStates.q + (-0.320854)*sailStates.r + (0.010218)*sailStates.de;
	CD = -0.077350;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.088603)*sailStates.p + (0.000000)*sailStates.q + (0.017624)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.234083)*sailStates.alpha + (-0.051253)*sailStates.beta + (-1.163241)*sailStates.p + (9.489210)*sailStates.q + (-0.055430)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-14.684078)*sailStates.alpha + (0.029361)*sailStates.beta + (8.608782)*sailStates.p + (-134.847153)*sailStates.q + (1.115731)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.239311)*sailStates.alpha + (-0.010855)*sailStates.beta + (-0.395116)*sailStates.p + (2.455900)*sailStates.q + (-0.043639)*sailStates.r + (0.000028)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end