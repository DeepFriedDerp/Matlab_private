function [aeroForces] = paramSpace_2_1_1_1_3_3_3(sailStates,airStates)

	CL = (5.119213)*sailStates.alpha + (0.379371)*sailStates.beta + (-3.451512)*sailStates.p + (41.881779)*sailStates.q + (1.760336)*sailStates.r + (0.011424)*sailStates.de;
	CD = -1.725560;
	CY = (0.487618)*sailStates.alpha + (-0.025257)*sailStates.beta + (0.757021)*sailStates.p + (1.697133)*sailStates.q + (-0.000159)*sailStates.r + (0.000370)*sailStates.de;

	Cl = (1.347872)*sailStates.alpha + (-0.343558)*sailStates.beta + (-1.975992)*sailStates.p + (16.955708)*sailStates.q + (1.682046)*sailStates.r + (0.001643)*sailStates.de;
	Cm = (-12.338553)*sailStates.alpha + (-1.458618)*sailStates.beta + (11.758264)*sailStates.p + (-161.037445)*sailStates.q + (-5.979490)*sailStates.r + (-0.072227)*sailStates.de;
	Cn = (-1.193122)*sailStates.alpha + (0.000383)*sailStates.beta + (-1.766265)*sailStates.p + (6.915032)*sailStates.q + (0.000092)*sailStates.r + (-0.000283)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end