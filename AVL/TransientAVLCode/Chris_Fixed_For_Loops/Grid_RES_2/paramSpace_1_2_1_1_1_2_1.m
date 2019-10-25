function [aeroForces] = paramSpace_1_2_1_1_1_2_1(sailStates,airStates)

	CL = (5.804085)*sailStates.alpha + (-0.778120)*sailStates.beta + (-5.898650)*sailStates.p + (54.202114)*sailStates.q + (2.499740)*sailStates.r + (0.010882)*sailStates.de;
	CD = -7.945030;
	CY = (2.617362)*sailStates.alpha + (-0.018066)*sailStates.beta + (1.416484)*sailStates.p + (3.931365)*sailStates.q + (0.187041)*sailStates.r + (0.000891)*sailStates.de;

	Cl = (-0.943653)*sailStates.alpha + (-1.004035)*sailStates.beta + (-4.030117)*sailStates.p + (34.515526)*sailStates.q + (2.699885)*sailStates.r + (0.005223)*sailStates.de;
	Cm = (5.341650)*sailStates.alpha + (3.282993)*sailStates.beta + (22.141088)*sailStates.p + (-234.642319)*sailStates.q + (-8.472774)*sailStates.r + (-0.081640)*sailStates.de;
	Cn = (-9.714726)*sailStates.alpha + (-0.100581)*sailStates.beta + (-3.811409)*sailStates.p + (16.410542)*sailStates.q + (-0.078172)*sailStates.r + (-0.000688)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end