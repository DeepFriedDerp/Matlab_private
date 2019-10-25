function [aeroForces] = paramSpace_1_2_3_1_3_2_3(sailStates,airStates)

	CL = (3.996000)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.319562)*sailStates.p + (42.670559)*sailStates.q + (-1.603258)*sailStates.r + (0.011300)*sailStates.de;
	CD = -0.041300;
	CY = (0.099168)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.539332)*sailStates.p + (2.260755)*sailStates.q + (-0.094884)*sailStates.r + (0.000488)*sailStates.de;

	Cl = (1.650384)*sailStates.alpha + (0.179467)*sailStates.beta + (-1.852723)*sailStates.p + (16.692860)*sailStates.q + (-1.174747)*sailStates.r + (0.001388)*sailStates.de;
	Cm = (-13.656678)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.619618)*sailStates.p + (-157.393341)*sailStates.q + (5.307070)*sailStates.r + (-0.070740)*sailStates.de;
	Cn = (0.484153)*sailStates.alpha + (0.031645)*sailStates.beta + (0.874448)*sailStates.p + (-4.540188)*sailStates.q + (0.004091)*sailStates.r + (-0.000757)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end