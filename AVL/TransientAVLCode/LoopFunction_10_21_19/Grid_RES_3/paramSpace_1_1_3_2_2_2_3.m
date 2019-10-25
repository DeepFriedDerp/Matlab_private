function [aeroForces] = paramSpace_1_1_3_2_2_2_3(sailStates,airStates)

	CL = (3.833263)*sailStates.alpha + (-0.154246)*sailStates.beta + (-2.877662)*sailStates.p + (38.238407)*sailStates.q + (-1.001472)*sailStates.r + (0.010908)*sailStates.de;
	CD = 0.057250;
	CY = (-0.003773)*sailStates.alpha + (-0.025440)*sailStates.beta + (-0.220263)*sailStates.p + (0.267956)*sailStates.q + (-0.038813)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.376077)*sailStates.alpha + (0.037012)*sailStates.beta + (-1.530017)*sailStates.p + (13.408581)*sailStates.q + (-0.689808)*sailStates.r + (0.000963)*sailStates.de;
	Cm = (-13.732400)*sailStates.alpha + (0.483786)*sailStates.beta + (9.545157)*sailStates.p + (-145.513718)*sailStates.q + (3.337382)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.259969)*sailStates.alpha + (0.014638)*sailStates.beta + (0.267662)*sailStates.p + (-0.567097)*sailStates.q + (-0.027138)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end