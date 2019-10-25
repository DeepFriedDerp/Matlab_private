function [aeroForces] = paramSpace_1_1_3_1_3_1_1(sailStates,airStates)

	CL = (7.403253)*sailStates.alpha + (-0.616922)*sailStates.beta + (-1.734441)*sailStates.p + (35.010807)*sailStates.q + (-3.233888)*sailStates.r + (0.011693)*sailStates.de;
	CD = -2.965290;
	CY = (0.684699)*sailStates.alpha + (-0.027289)*sailStates.beta + (-1.386885)*sailStates.p + (1.081939)*sailStates.q + (-0.244442)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (2.352246)*sailStates.alpha + (0.464420)*sailStates.beta + (-0.525054)*sailStates.p + (5.560686)*sailStates.q + (-2.766041)*sailStates.r + (-0.000764)*sailStates.de;
	Cm = (-11.161659)*sailStates.alpha + (2.265781)*sailStates.beta + (3.650099)*sailStates.p + (-108.520653)*sailStates.q + (10.705864)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-2.523181)*sailStates.alpha + (0.125457)*sailStates.beta + (3.074344)*sailStates.p + (-14.703683)*sailStates.q + (0.070401)*sailStates.r + (-0.000507)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end