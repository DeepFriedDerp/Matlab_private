function [aeroForces] = paramSpace_2_1_3_1_2_3_3(sailStates,airStates)

	CL = (6.028348)*sailStates.alpha + (0.486411)*sailStates.beta + (-3.451512)*sailStates.p + (41.881779)*sailStates.q + (2.231766)*sailStates.r + (0.011424)*sailStates.de;
	CD = -2.312730;
	CY = (0.392317)*sailStates.alpha + (-0.024831)*sailStates.beta + (1.072489)*sailStates.p + (0.000001)*sailStates.q + (0.000000)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (2.033466)*sailStates.alpha + (-0.401561)*sailStates.beta + (-1.975992)*sailStates.p + (16.955708)*sailStates.q + (2.110771)*sailStates.r + (0.001643)*sailStates.de;
	Cm = (-13.432201)*sailStates.alpha + (-1.977230)*sailStates.beta + (11.758264)*sailStates.p + (-161.037445)*sailStates.q + (-7.627107)*sailStates.r + (-0.072227)*sailStates.de;
	Cn = (-1.308450)*sailStates.alpha + (0.000164)*sailStates.beta + (-2.388693)*sailStates.p + (10.749860)*sailStates.q + (-0.000313)*sailStates.r + (0.000214)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end