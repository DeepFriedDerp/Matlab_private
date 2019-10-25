function [aeroForces] = paramSpace_5_1_2_1_2_1_1(sailStates,airStates)

	CL = (5.230201)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.082894)*sailStates.p + (33.468552)*sailStates.q + (-1.968011)*sailStates.r + (0.011210)*sailStates.de;
	CD = -1.002800;
	CY = (0.285471)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.855345)*sailStates.p + (0.768920)*sailStates.q + (-0.089927)*sailStates.r + (0.000164)*sailStates.de;

	Cl = (1.531751)*sailStates.alpha + (0.396699)*sailStates.beta + (-0.793112)*sailStates.p + (6.622671)*sailStates.q + (-1.696977)*sailStates.r + (-0.000355)*sailStates.de;
	Cm = (-13.619825)*sailStates.alpha + (0.000000)*sailStates.beta + (6.332959)*sailStates.p + (-122.164581)*sailStates.q + (6.637126)*sailStates.r + (-0.068317)*sailStates.de;
	Cn = (-1.049361)*sailStates.alpha + (0.041695)*sailStates.beta + (1.832428)*sailStates.p + (-8.670398)*sailStates.q + (0.022991)*sailStates.r + (-0.000350)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end