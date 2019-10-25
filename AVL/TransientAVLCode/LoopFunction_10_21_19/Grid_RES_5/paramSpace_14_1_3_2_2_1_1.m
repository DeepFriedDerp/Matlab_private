function [aeroForces] = paramSpace_14_1_3_2_2_1_1(sailStates,airStates)

	CL = (3.871433)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.232931)*sailStates.p + (31.515308)*sailStates.q + (0.318981)*sailStates.r + (0.010048)*sailStates.de;
	CD = -0.029280;
	CY = (0.077435)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.096304)*sailStates.p + (0.571905)*sailStates.q + (0.020491)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.104034)*sailStates.alpha + (0.025495)*sailStates.beta + (-0.982808)*sailStates.p + (7.743234)*sailStates.q + (0.072018)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-14.362795)*sailStates.alpha + (0.000000)*sailStates.beta + (7.951927)*sailStates.p + (-129.462372)*sailStates.q + (-1.143271)*sailStates.r + (-0.066948)*sailStates.de;
	Cn = (-0.322765)*sailStates.alpha + (-0.005419)*sailStates.beta + (0.381846)*sailStates.p + (-2.766414)*sailStates.q + (-0.052118)*sailStates.r + (-0.000199)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end