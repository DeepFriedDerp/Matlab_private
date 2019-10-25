function [aeroForces] = paramSpace_1_1_4_3_1_1_2(sailStates,airStates)

	CL = (4.043650)*sailStates.alpha + (-0.308812)*sailStates.beta + (-2.526753)*sailStates.p + (37.189789)*sailStates.q + (-1.501948)*sailStates.r + (0.011065)*sailStates.de;
	CD = -0.128000;
	CY = (-0.064270)*sailStates.alpha + (-0.023380)*sailStates.beta + (-0.423695)*sailStates.p + (-0.489620)*sailStates.q + (-0.084331)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.245744)*sailStates.alpha + (0.130434)*sailStates.beta + (-1.226750)*sailStates.p + (11.011510)*sailStates.q + (-1.156889)*sailStates.r + (0.000487)*sailStates.de;
	Cm = (-12.803172)*sailStates.alpha + (1.066895)*sailStates.beta + (7.859110)*sailStates.p + (-134.519470)*sailStates.q + (4.984829)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (0.141800)*sailStates.alpha + (0.043196)*sailStates.beta + (0.789679)*sailStates.p + (-2.518552)*sailStates.q + (-0.024689)*sailStates.r + (0.000053)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end