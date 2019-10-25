function [aeroForces] = paramSpace_2_1_2_2_3_1_3(sailStates,airStates)

	CL = (4.719357)*sailStates.alpha + (-0.350401)*sailStates.beta + (-2.967773)*sailStates.p + (39.219933)*sailStates.q + (-1.598558)*sailStates.r + (0.011299)*sailStates.de;
	CD = -0.619290;
	CY = (-0.005038)*sailStates.alpha + (-0.025807)*sailStates.beta + (-0.700075)*sailStates.p + (0.870359)*sailStates.q + (-0.045916)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.793494)*sailStates.alpha + (0.205539)*sailStates.beta + (-1.579692)*sailStates.p + (13.697928)*sailStates.q + (-1.393713)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.104148)*sailStates.alpha + (1.362179)*sailStates.beta + (9.718369)*sailStates.p + (-146.834122)*sailStates.q + (5.417056)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.249729)*sailStates.alpha + (0.022803)*sailStates.beta + (1.446963)*sailStates.p + (-6.815829)*sailStates.q + (0.010277)*sailStates.r + (-0.000373)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end