function [aeroForces] = paramSpace_4_1_3_3_2_3_1(sailStates,airStates)

	CL = (4.094713)*sailStates.alpha + (0.354173)*sailStates.beta + (-2.260188)*sailStates.p + (35.229969)*sailStates.q + (1.543396)*sailStates.r + (0.010768)*sailStates.de;
	CD = -0.183210;
	CY = (-0.030077)*sailStates.alpha + (-0.024146)*sailStates.beta + (0.499242)*sailStates.p + (0.194784)*sailStates.q + (-0.099298)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.219519)*sailStates.alpha + (-0.156208)*sailStates.beta + (-1.011277)*sailStates.p + (9.059740)*sailStates.q + (1.223863)*sailStates.r + (0.000127)*sailStates.de;
	Cm = (-12.399308)*sailStates.alpha + (-1.340783)*sailStates.beta + (6.862782)*sailStates.p + (-126.796555)*sailStates.q + (-5.150430)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (0.163707)*sailStates.alpha + (0.050621)*sailStates.beta + (-0.973373)*sailStates.p + (3.603785)*sailStates.q + (-0.009860)*sailStates.r + (0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end