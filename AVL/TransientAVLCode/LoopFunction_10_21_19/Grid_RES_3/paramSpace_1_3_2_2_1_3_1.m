function [aeroForces] = paramSpace_1_3_2_2_1_3_1(sailStates,airStates)

	CL = (4.299860)*sailStates.alpha + (-0.089486)*sailStates.beta + (-2.045943)*sailStates.p + (28.393990)*sailStates.q + (0.479347)*sailStates.r + (0.009794)*sailStates.de;
	CD = -0.457810;
	CY = (-0.191942)*sailStates.alpha + (-0.027419)*sailStates.beta + (0.437553)*sailStates.p + (-1.027328)*sailStates.q + (0.077152)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.105831)*sailStates.alpha + (-0.209783)*sailStates.beta + (-0.794571)*sailStates.p + (5.349488)*sailStates.q + (0.628486)*sailStates.r + (-0.000247)*sailStates.de;
	Cm = (-15.339276)*sailStates.alpha + (0.362276)*sailStates.beta + (7.814238)*sailStates.p + (-124.672363)*sailStates.q + (-1.530223)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.720297)*sailStates.alpha + (-0.023326)*sailStates.beta + (-1.074338)*sailStates.p + (5.895392)*sailStates.q + (-0.053911)*sailStates.r + (0.000375)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end