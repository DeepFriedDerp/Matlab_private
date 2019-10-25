function [aeroForces] = paramSpace_4_3_3_3_3_3_1(sailStates,airStates)

	CL = (4.035898)*sailStates.alpha + (-0.113083)*sailStates.beta + (-2.293505)*sailStates.p + (35.418041)*sailStates.q + (1.425614)*sailStates.r + (0.010933)*sailStates.de;
	CD = -0.126890;
	CY = (0.042696)*sailStates.alpha + (-0.025728)*sailStates.beta + (0.423187)*sailStates.p + (0.684401)*sailStates.q + (-0.084153)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.042735)*sailStates.alpha + (-0.268181)*sailStates.beta + (-0.966164)*sailStates.p + (8.317209)*sailStates.q + (1.113676)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-12.538435)*sailStates.alpha + (0.430934)*sailStates.beta + (7.092571)*sailStates.p + (-128.521423)*sailStates.q + (-4.771190)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.116636)*sailStates.alpha + (0.048081)*sailStates.beta + (-0.824195)*sailStates.p + (2.652602)*sailStates.q + (-0.019428)*sailStates.r + (-0.000135)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end