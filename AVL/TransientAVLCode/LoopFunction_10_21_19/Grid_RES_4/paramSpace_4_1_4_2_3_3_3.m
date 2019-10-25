function [aeroForces] = paramSpace_4_1_4_2_3_3_3(sailStates,airStates)

	CL = (4.057870)*sailStates.alpha + (0.467369)*sailStates.beta + (-2.946980)*sailStates.p + (41.866898)*sailStates.q + (1.977621)*sailStates.r + (0.011256)*sailStates.de;
	CD = -0.359160;
	CY = (0.171760)*sailStates.alpha + (-0.023196)*sailStates.beta + (0.638056)*sailStates.p + (0.455223)*sailStates.q + (-0.126868)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.310046)*sailStates.alpha + (-0.198391)*sailStates.beta + (-1.557179)*sailStates.p + (14.403112)*sailStates.q + (1.634302)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-11.339773)*sailStates.alpha + (-1.825040)*sailStates.beta + (8.934983)*sailStates.p + (-145.756378)*sailStates.q + (-6.623023)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.595876)*sailStates.alpha + (0.063229)*sailStates.beta + (-1.178948)*sailStates.p + (3.713604)*sailStates.q + (-0.029358)*sailStates.r + (-0.000036)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end