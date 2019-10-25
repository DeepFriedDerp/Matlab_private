function [aeroForces] = paramSpace_2_1_3_3_1_3_1(sailStates,airStates)

	CL = (4.312182)*sailStates.alpha + (0.176761)*sailStates.beta + (-2.301224)*sailStates.p + (32.621426)*sailStates.q + (0.793209)*sailStates.r + (0.010842)*sailStates.de;
	CD = -0.233240;
	CY = (-0.106056)*sailStates.alpha + (-0.024956)*sailStates.beta + (0.409712)*sailStates.p + (-0.499211)*sailStates.q + (-0.000047)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.318191)*sailStates.alpha + (-0.137454)*sailStates.beta + (-1.036890)*sailStates.p + (8.281624)*sailStates.q + (0.748469)*sailStates.r + (0.000116)*sailStates.de;
	Cm = (-14.734479)*sailStates.alpha + (-0.748970)*sailStates.beta + (7.903118)*sailStates.p + (-129.527451)*sailStates.q + (-2.718523)*sailStates.r + (-0.068843)*sailStates.de;
	Cn = (0.353774)*sailStates.alpha + (0.000217)*sailStates.beta + (-0.887446)*sailStates.p + (4.286860)*sailStates.q + (-0.000171)*sailStates.r + (0.000200)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end