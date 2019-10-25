function [aeroForces] = paramSpace_1_3_3_2_2_2_3(sailStates,airStates)

	CL = (3.833263)*sailStates.alpha + (0.154246)*sailStates.beta + (-2.877662)*sailStates.p + (38.238403)*sailStates.q + (-1.001472)*sailStates.r + (0.010908)*sailStates.de;
	CD = 0.057250;
	CY = (-0.003773)*sailStates.alpha + (-0.024222)*sailStates.beta + (-0.220263)*sailStates.p + (0.267956)*sailStates.q + (-0.038813)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.264142)*sailStates.alpha + (0.158115)*sailStates.beta + (-1.445365)*sailStates.p + (12.347712)*sailStates.q + (-0.674982)*sailStates.r + (0.000734)*sailStates.de;
	Cm = (-13.732402)*sailStates.alpha + (-0.483786)*sailStates.beta + (9.545156)*sailStates.p + (-145.513718)*sailStates.q + (3.337382)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.216425)*sailStates.alpha + (0.019768)*sailStates.beta + (0.282589)*sailStates.p + (-0.754157)*sailStates.q + (-0.024524)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end