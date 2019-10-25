function [aeroForces] = paramSpace_1_3_3_2_1_3_1(sailStates,airStates)

	CL = (4.358663)*sailStates.alpha + (-0.113825)*sailStates.beta + (-2.046659)*sailStates.p + (28.336761)*sailStates.q + (0.489899)*sailStates.r + (0.009897)*sailStates.de;
	CD = -0.483310;
	CY = (-0.195248)*sailStates.alpha + (-0.027165)*sailStates.beta + (0.456773)*sailStates.p + (-1.027329)*sailStates.q + (0.080444)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.111295)*sailStates.alpha + (-0.219348)*sailStates.beta + (-0.794943)*sailStates.p + (5.346832)*sailStates.q + (0.659326)*sailStates.r + (-0.000247)*sailStates.de;
	Cm = (-15.582216)*sailStates.alpha + (0.518798)*sailStates.beta + (7.824927)*sailStates.p + (-124.672363)*sailStates.q + (-1.590845)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.730424)*sailStates.alpha + (-0.025389)*sailStates.beta + (-1.103116)*sailStates.p + (5.910455)*sailStates.q + (-0.053656)*sailStates.r + (0.000365)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end