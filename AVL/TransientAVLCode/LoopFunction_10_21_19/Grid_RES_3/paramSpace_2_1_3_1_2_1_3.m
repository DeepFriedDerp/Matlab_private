function [aeroForces] = paramSpace_2_1_3_1_2_1_3(sailStates,airStates)

	CL = (5.950792)*sailStates.alpha + (-0.434156)*sailStates.beta + (-3.451512)*sailStates.p + (41.881779)*sailStates.q + (-2.204754)*sailStates.r + (0.011424)*sailStates.de;
	CD = -2.235170;
	CY = (-0.377502)*sailStates.alpha + (-0.024831)*sailStates.beta + (-1.031990)*sailStates.p + (-0.000001)*sailStates.q + (-0.000000)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (2.030032)*sailStates.alpha + (0.386038)*sailStates.beta + (-1.975992)*sailStates.p + (16.955708)*sailStates.q + (-2.044872)*sailStates.r + (0.001643)*sailStates.de;
	Cm = (-13.432201)*sailStates.alpha + (1.646303)*sailStates.beta + (11.758264)*sailStates.p + (-161.037445)*sailStates.q + (7.468941)*sailStates.r + (-0.072227)*sailStates.de;
	Cn = (1.257238)*sailStates.alpha + (-0.000245)*sailStates.beta + (2.329018)*sailStates.p + (-10.719576)*sailStates.q + (-0.000142)*sailStates.r + (-0.000256)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end