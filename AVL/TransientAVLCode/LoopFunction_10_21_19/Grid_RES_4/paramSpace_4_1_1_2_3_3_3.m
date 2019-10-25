function [aeroForces] = paramSpace_4_1_1_2_3_3_3(sailStates,airStates)

	CL = (4.143115)*sailStates.alpha + (0.404188)*sailStates.beta + (-2.949523)*sailStates.p + (41.721058)*sailStates.q + (1.950022)*sailStates.r + (0.011520)*sailStates.de;
	CD = -0.358340;
	CY = (0.164257)*sailStates.alpha + (-0.023479)*sailStates.beta + (0.594632)*sailStates.p + (0.455224)*sailStates.q + (-0.118329)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.326077)*sailStates.alpha + (-0.180772)*sailStates.beta + (-1.558363)*sailStates.p + (14.396544)*sailStates.q + (1.563137)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-11.949662)*sailStates.alpha + (-1.426616)*sailStates.beta + (8.966455)*sailStates.p + (-145.756378)*sailStates.q + (-6.464808)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.567716)*sailStates.alpha + (0.059716)*sailStates.beta + (-1.113460)*sailStates.p + (3.680593)*sailStates.q + (-0.027967)*sailStates.r + (0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end