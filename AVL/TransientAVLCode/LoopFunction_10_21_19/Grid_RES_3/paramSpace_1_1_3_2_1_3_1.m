function [aeroForces] = paramSpace_1_1_3_2_1_3_1(sailStates,airStates)

	CL = (4.358663)*sailStates.alpha + (0.113825)*sailStates.beta + (-2.046659)*sailStates.p + (28.336761)*sailStates.q + (0.489899)*sailStates.r + (0.009897)*sailStates.de;
	CD = -0.483310;
	CY = (-0.195248)*sailStates.alpha + (-0.022497)*sailStates.beta + (0.456773)*sailStates.p + (-1.027329)*sailStates.q + (0.080444)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.261897)*sailStates.alpha + (-0.155325)*sailStates.beta + (-0.879595)*sailStates.p + (6.407699)*sailStates.q + (0.644501)*sailStates.r + (-0.000021)*sailStates.de;
	Cm = (-15.582216)*sailStates.alpha + (-0.518798)*sailStates.beta + (7.824927)*sailStates.p + (-124.672379)*sailStates.q + (-1.590845)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.712115)*sailStates.alpha + (-0.040676)*sailStates.beta + (-1.118042)*sailStates.p + (6.097514)*sailStates.q + (-0.056271)*sailStates.r + (0.000365)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end