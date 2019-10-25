function [aeroForces] = paramSpace_4_2_3_3_3_3_1(sailStates,airStates)

	CL = (4.035898)*sailStates.alpha + (0.113083)*sailStates.beta + (-2.293505)*sailStates.p + (35.418041)*sailStates.q + (1.425614)*sailStates.r + (0.010933)*sailStates.de;
	CD = -0.126890;
	CY = (0.042696)*sailStates.alpha + (-0.024225)*sailStates.beta + (0.423187)*sailStates.p + (0.684401)*sailStates.q + (-0.084153)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.090197)*sailStates.alpha + (-0.208489)*sailStates.beta + (-0.997702)*sailStates.p + (8.714179)*sailStates.q + (1.119964)*sailStates.r + (0.000078)*sailStates.de;
	Cm = (-12.538435)*sailStates.alpha + (-0.430934)*sailStates.beta + (7.092571)*sailStates.p + (-128.521423)*sailStates.q + (-4.771188)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.085540)*sailStates.alpha + (0.046735)*sailStates.beta + (-0.817922)*sailStates.p + (2.573640)*sailStates.q + (-0.020678)*sailStates.r + (-0.000135)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end