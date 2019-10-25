function [aeroForces] = paramSpace_4_1_1_2_3_2_3(sailStates,airStates)

	CL = (3.714611)*sailStates.alpha + (0.167283)*sailStates.beta + (-2.872293)*sailStates.p + (38.118717)*sailStates.q + (0.927411)*sailStates.r + (0.010807)*sailStates.de;
	CD = 0.076620;
	CY = (0.078568)*sailStates.alpha + (-0.023479)*sailStates.beta + (0.125945)*sailStates.p + (0.455225)*sailStates.q + (-0.025101)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.307698)*sailStates.alpha + (-0.015069)*sailStates.beta + (-1.533944)*sailStates.p + (13.445457)*sailStates.q + (0.614639)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-13.488693)*sailStates.alpha + (-0.519296)*sailStates.beta + (9.635203)*sailStates.p + (-145.756378)*sailStates.q + (-3.102781)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.345916)*sailStates.alpha + (0.009033)*sailStates.beta + (-0.047064)*sailStates.p + (-1.100847)*sailStates.q + (-0.052430)*sailStates.r + (-0.000095)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end