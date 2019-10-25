function [aeroForces] = paramSpace_11_1_1_1_1_1_2(sailStates,airStates)

	CL = (4.387283)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.990434)*sailStates.p + (36.804390)*sailStates.q + (-0.406275)*sailStates.r + (0.010812)*sailStates.de;
	CD = -0.520510;
	CY = (-0.209830)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.315627)*sailStates.p + (-1.178225)*sailStates.q + (0.033299)*sailStates.r + (-0.000256)*sailStates.de;

	Cl = (1.362108)*sailStates.alpha + (0.205283)*sailStates.beta + (-1.588298)*sailStates.p + (13.069715)*sailStates.q + (-0.576875)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.802983)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.615519)*sailStates.p + (-150.099487)*sailStates.q + (1.411976)*sailStates.r + (-0.071133)*sailStates.de;
	Cn = (0.180310)*sailStates.alpha + (-0.021576)*sailStates.beta + (0.880461)*sailStates.p + (-3.557816)*sailStates.q + (-0.014895)*sailStates.r + (0.000280)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end