function [aeroForces] = paramSpace_4_3_4_1_1_2_3(sailStates,airStates)

	CL = (3.872237)*sailStates.alpha + (-0.114784)*sailStates.beta + (-3.281883)*sailStates.p + (42.894802)*sailStates.q + (1.769843)*sailStates.r + (0.010936)*sailStates.de;
	CD = -0.003430;
	CY = (-0.081815)*sailStates.alpha + (-0.022260)*sailStates.beta + (0.613371)*sailStates.p + (-2.326708)*sailStates.q + (-0.122257)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (1.657906)*sailStates.alpha + (-0.256130)*sailStates.beta + (-1.815653)*sailStates.p + (16.535378)*sailStates.q + (1.340963)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-12.940939)*sailStates.alpha + (0.433313)*sailStates.beta + (10.336803)*sailStates.p + (-156.352325)*sailStates.q + (-5.914863)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-0.577536)*sailStates.alpha + (0.041344)*sailStates.beta + (-0.983206)*sailStates.p + (4.697607)*sailStates.q + (0.000769)*sailStates.r + (0.000734)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end