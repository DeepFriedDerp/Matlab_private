function [aeroForces] = paramSpace_2_3_3_3_2_2_3(sailStates,airStates)

	CL = (4.029935)*sailStates.alpha + (0.021210)*sailStates.beta + (-2.827029)*sailStates.p + (37.069084)*sailStates.q + (-0.363101)*sailStates.r + (0.011185)*sailStates.de;
	CD = 0.029310;
	CY = (-0.000323)*sailStates.alpha + (-0.024955)*sailStates.beta + (-0.078648)*sailStates.p + (0.065300)*sailStates.q + (-0.005153)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.324551)*sailStates.alpha + (0.044693)*sailStates.beta + (-1.404363)*sailStates.p + (11.556973)*sailStates.q + (-0.243428)*sailStates.r + (0.000645)*sailStates.de;
	Cm = (-14.595313)*sailStates.alpha + (-0.066694)*sailStates.beta + (9.627115)*sailStates.p + (-144.341232)*sailStates.q + (1.218151)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.069623)*sailStates.alpha + (0.002529)*sailStates.beta + (0.099469)*sailStates.p + (-0.257109)*sailStates.q + (-0.003438)*sailStates.r + (-0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end