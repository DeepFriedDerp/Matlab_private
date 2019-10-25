function [aeroForces] = paramSpace_1_1_4_2_3_2_3(sailStates,airStates)

	CL = (3.914521)*sailStates.alpha + (-0.221161)*sailStates.beta + (-2.827632)*sailStates.p + (38.367958)*sailStates.q + (-1.314782)*sailStates.r + (0.010796)*sailStates.de;
	CD = 0.030640;
	CY = (0.074112)*sailStates.alpha + (-0.027822)*sailStates.beta + (-0.366360)*sailStates.p + (1.057314)*sailStates.q + (-0.072760)*sailStates.r + (0.000224)*sailStates.de;

	Cl = (1.468152)*sailStates.alpha + (0.049391)*sailStates.beta + (-1.506163)*sailStates.p + (13.524264)*sailStates.q + (-0.932534)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-13.647470)*sailStates.alpha + (0.697050)*sailStates.beta + (9.117032)*sailStates.p + (-143.598221)*sailStates.q + (4.354354)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.235405)*sailStates.alpha + (0.026875)*sailStates.beta + (0.554227)*sailStates.p + (-2.340608)*sailStates.q + (-0.016124)*sailStates.r + (-0.000370)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end