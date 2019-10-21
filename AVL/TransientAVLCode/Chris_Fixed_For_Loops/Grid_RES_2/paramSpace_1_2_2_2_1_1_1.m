function [aeroForces] = paramSpace_1_2_2_2_1_1_1(sailStates,airStates)

	CL = (5.553961)*sailStates.alpha + (-0.797510)*sailStates.beta + (-5.876318)*sailStates.p + (54.147953)*sailStates.q + (2.401441)*sailStates.r + (0.011045)*sailStates.de;
	CD = -7.607420;
	CY = (2.566577)*sailStates.alpha + (-0.019499)*sailStates.beta + (1.380128)*sailStates.p + (4.099639)*sailStates.q + (0.182859)*sailStates.r + (0.000928)*sailStates.de;

	Cl = (-1.073139)*sailStates.alpha + (-0.995111)*sailStates.beta + (-4.009361)*sailStates.p + (34.376930)*sailStates.q + (2.639911)*sailStates.r + (0.005176)*sailStates.de;
	Cm = (4.914353)*sailStates.alpha + (3.474138)*sailStates.beta + (21.999422)*sailStates.p + (-233.765045)*sailStates.q + (-8.219015)*sailStates.r + (-0.081489)*sailStates.de;
	Cn = (-9.444541)*sailStates.alpha + (-0.098697)*sailStates.beta + (-3.707390)*sailStates.p + (15.613116)*sailStates.q + (-0.075644)*sailStates.r + (-0.000829)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end