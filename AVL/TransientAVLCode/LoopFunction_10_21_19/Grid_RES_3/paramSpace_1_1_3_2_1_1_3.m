function [aeroForces] = paramSpace_1_1_3_2_1_1_3(sailStates,airStates)

	CL = (4.185491)*sailStates.alpha + (-0.340454)*sailStates.beta + (-2.966718)*sailStates.p + (41.333431)*sailStates.q + (-1.825536)*sailStates.r + (0.011551)*sailStates.de;
	CD = -0.361920;
	CY = (-0.163347)*sailStates.alpha + (-0.023714)*sailStates.beta + (-0.569683)*sailStates.p + (-0.491412)*sailStates.q + (-0.100497)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.341453)*sailStates.alpha + (0.192866)*sailStates.beta + (-1.564308)*sailStates.p + (14.219914)*sailStates.q + (-1.477125)*sailStates.r + (0.001009)*sailStates.de;
	Cm = (-12.310378)*sailStates.alpha + (1.213746)*sailStates.beta + (9.181442)*sailStates.p + (-146.474228)*sailStates.q + (6.076828)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.526538)*sailStates.alpha + (0.051733)*sailStates.beta + (1.081034)*sailStates.p + (-3.645790)*sailStates.q + (-0.021330)*sailStates.r + (0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end