function [aeroForces] = paramSpace_4_1_3_1_3_1_2(sailStates,airStates)

	CL = (6.571000)*sailStates.alpha + (-0.367855)*sailStates.beta + (-2.340064)*sailStates.p + (26.831461)*sailStates.q + (-1.695132)*sailStates.r + (0.008878)*sailStates.de;
	CD = -2.546850;
	CY = (0.163111)*sailStates.alpha + (-0.019316)*sailStates.beta + (-1.069329)*sailStates.p + (1.664522)*sailStates.q + (0.212762)*sailStates.r + (0.000351)*sailStates.de;

	Cl = (2.477875)*sailStates.alpha + (0.355484)*sailStates.beta + (-1.178040)*sailStates.p + (8.245489)*sailStates.q + (-1.745009)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-18.002428)*sailStates.alpha + (1.391973)*sailStates.beta + (10.146942)*sailStates.p + (-136.195908)*sailStates.q + (5.465541)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (-0.828146)*sailStates.alpha + (-0.113711)*sailStates.beta + (2.598610)*sailStates.p + (-13.752662)*sailStates.q + (-0.123265)*sailStates.r + (-0.000688)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end