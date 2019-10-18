function [aeroForces] = paramSpace_2_2_2_1_1_2_1(sailStates,airStates)

	CL = (5.241017)*sailStates.alpha + (-3.973766)*sailStates.beta + (-3.454328)*sailStates.p + (47.463860)*sailStates.q + (2.196825)*sailStates.r + (0.010395)*sailStates.de;
	CD = -5.980110;
	CY = (1.787138)*sailStates.alpha + (-0.274196)*sailStates.beta + (0.319336)*sailStates.p + (15.591977)*sailStates.q + (-0.030998)*sailStates.r + (0.002969)*sailStates.de;

	Cl = (-5.545285)*sailStates.alpha + (-1.244475)*sailStates.beta + (-1.676054)*sailStates.p + (14.233083)*sailStates.q + (2.458917)*sailStates.r + (0.001232)*sailStates.de;
	Cm = (5.846375)*sailStates.alpha + (18.199808)*sailStates.beta + (10.747020)*sailStates.p + (-151.578064)*sailStates.q + (-7.834368)*sailStates.r + (-0.055301)*sailStates.de;
	Cn = (-1.837532)*sailStates.alpha + (0.389784)*sailStates.beta + (-0.912365)*sailStates.p + (-8.928095)*sailStates.q + (-0.204027)*sailStates.r + (-0.003910)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end