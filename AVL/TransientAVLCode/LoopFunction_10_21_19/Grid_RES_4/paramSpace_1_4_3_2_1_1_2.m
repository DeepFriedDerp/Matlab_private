function [aeroForces] = paramSpace_1_4_3_2_1_1_2(sailStates,airStates)

	CL = (4.221460)*sailStates.alpha + (0.404254)*sailStates.beta + (-2.561160)*sailStates.p + (38.467178)*sailStates.q + (-1.803754)*sailStates.r + (0.011230)*sailStates.de;
	CD = -0.363910;
	CY = (-0.101307)*sailStates.alpha + (-0.027114)*sailStates.beta + (-0.561319)*sailStates.p + (-0.756268)*sailStates.q + (-0.111680)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.102045)*sailStates.alpha + (0.423172)*sailStates.beta + (-1.145523)*sailStates.p + (10.148050)*sailStates.q + (-1.440728)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-11.985591)*sailStates.alpha + (-1.487949)*sailStates.beta + (7.704400)*sailStates.p + (-134.899979)*sailStates.q + (6.001215)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (0.042396)*sailStates.alpha + (0.062654)*sailStates.beta + (1.117533)*sailStates.p + (-3.848978)*sailStates.q + (-0.018943)*sailStates.r + (0.000112)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end