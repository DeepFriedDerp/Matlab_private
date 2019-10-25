function [aeroForces] = paramSpace_1_2_1_2_2_1_1(sailStates,airStates)

	CL = (5.444490)*sailStates.alpha + (-0.773601)*sailStates.beta + (-5.980881)*sailStates.p + (54.883629)*sailStates.q + (2.438729)*sailStates.r + (0.010928)*sailStates.de;
	CD = -7.919530;
	CY = (2.651323)*sailStates.alpha + (-0.017468)*sailStates.beta + (1.379701)*sailStates.p + (4.280846)*sailStates.q + (0.182247)*sailStates.r + (0.000971)*sailStates.de;

	Cl = (-1.295934)*sailStates.alpha + (-0.995260)*sailStates.beta + (-4.099655)*sailStates.p + (35.196201)*sailStates.q + (2.654645)*sailStates.r + (0.005342)*sailStates.de;
	Cm = (6.524937)*sailStates.alpha + (3.272929)*sailStates.beta + (22.388107)*sailStates.p + (-236.856659)*sailStates.q + (-8.273481)*sailStates.r + (-0.082022)*sailStates.de;
	Cn = (-9.864099)*sailStates.alpha + (-0.100523)*sailStates.beta + (-3.748413)*sailStates.p + (15.910400)*sailStates.q + (-0.074707)*sailStates.r + (-0.000794)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end