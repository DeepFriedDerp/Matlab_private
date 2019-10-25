function [aeroForces] = paramSpace_1_4_4_2_1_2_3(sailStates,airStates)

	CL = (3.714611)*sailStates.alpha + (0.167283)*sailStates.beta + (-2.872293)*sailStates.p + (38.118717)*sailStates.q + (-0.927412)*sailStates.r + (0.010807)*sailStates.de;
	CD = 0.076620;
	CY = (-0.078568)*sailStates.alpha + (-0.026093)*sailStates.beta + (-0.125945)*sailStates.p + (-0.455225)*sailStates.q + (-0.025101)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.184237)*sailStates.alpha + (0.142258)*sailStates.beta + (-1.439538)*sailStates.p + (12.257578)*sailStates.q + (-0.595988)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-13.488694)*sailStates.alpha + (-0.519296)*sailStates.beta + (9.635202)*sailStates.p + (-145.756409)*sailStates.q + (3.102780)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.299360)*sailStates.alpha + (0.022261)*sailStates.beta + (0.065842)*sailStates.p + (0.864563)*sailStates.q + (-0.048720)*sailStates.r + (0.000095)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end