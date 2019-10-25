function [aeroForces] = paramSpace_3_3_3_3_1_2_3(sailStates,airStates)

	CL = (4.049082)*sailStates.alpha + (-0.034505)*sailStates.beta + (-2.821745)*sailStates.p + (37.113258)*sailStates.q + (0.502370)*sailStates.r + (0.011153)*sailStates.de;
	CD = 0.023620;
	CY = (-0.052039)*sailStates.alpha + (-0.024755)*sailStates.beta + (0.174224)*sailStates.p + (-0.563442)*sailStates.q + (-0.011439)*sailStates.r + (-0.000122)*sailStates.de;

	Cl = (1.352969)*sailStates.alpha + (-0.075482)*sailStates.beta + (-1.401114)*sailStates.p + (11.566430)*sailStates.q + (0.373902)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.563553)*sailStates.alpha + (0.133383)*sailStates.beta + (9.566449)*sailStates.p + (-144.107040)*sailStates.q + (-1.705658)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (-0.020107)*sailStates.alpha + (0.004082)*sailStates.beta + (-0.287069)*sailStates.p + (1.387163)*sailStates.q + (0.000327)*sailStates.r + (0.000181)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end