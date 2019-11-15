function [aeroForces] = paramSpace_2_2_1_1_2_3_3(sailStates,airStates)

	CL = (5.804388)*sailStates.alpha + (0.133650)*sailStates.beta + (-3.392897)*sailStates.p + (39.502869)*sailStates.q + (1.757374)*sailStates.r + (0.010911)*sailStates.de;
	CD = -2.120120;
	CY = (0.362576)*sailStates.alpha + (-0.025079)*sailStates.beta + (0.915672)*sailStates.p + (0.221994)*sailStates.q + (0.059993)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.953017)*sailStates.alpha + (-0.429762)*sailStates.beta + (-1.928503)*sailStates.p + (15.993985)*sailStates.q + (1.717290)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-14.222004)*sailStates.alpha + (-0.506732)*sailStates.beta + (12.197871)*sailStates.p + (-161.490479)*sailStates.q + (-5.923644)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-0.997247)*sailStates.alpha + (-0.032011)*sailStates.beta + (-2.196980)*sailStates.p + (10.416514)*sailStates.q + (-0.023311)*sailStates.r + (0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end