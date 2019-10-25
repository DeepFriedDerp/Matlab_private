function [aeroForces] = paramSpace_1_1_2_3_1_3_2(sailStates,airStates)

	CL = (3.911599)*sailStates.alpha + (-0.043457)*sailStates.beta + (-2.425457)*sailStates.p + (32.627789)*sailStates.q + (-0.196425)*sailStates.r + (0.009975)*sailStates.de;
	CD = -0.098380;
	CY = (-0.057780)*sailStates.alpha + (-0.023177)*sailStates.beta + (0.153678)*sailStates.p + (-0.489619)*sailStates.q + (0.030586)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.296758)*sailStates.alpha + (-0.071149)*sailStates.beta + (-1.194446)*sailStates.p + (9.785974)*sailStates.q + (0.022917)*sailStates.r + (0.000487)*sailStates.de;
	Cm = (-14.406643)*sailStates.alpha + (0.156964)*sailStates.beta + (8.704541)*sailStates.p + (-134.519470)*sailStates.q + (0.734559)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (0.323294)*sailStates.alpha + (-0.020056)*sailStates.beta + (-0.546131)*sailStates.p + (3.642631)*sailStates.q + (-0.056858)*sailStates.r + (0.000187)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end