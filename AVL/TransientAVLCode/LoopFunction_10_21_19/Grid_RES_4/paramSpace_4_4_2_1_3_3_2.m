function [aeroForces] = paramSpace_4_4_2_1_3_3_2(sailStates,airStates)

	CL = (5.462997)*sailStates.alpha + (-0.657050)*sailStates.beta + (-2.680767)*sailStates.p + (42.647366)*sailStates.q + (2.800455)*sailStates.r + (0.012088)*sailStates.de;
	CD = -1.834630;
	CY = (0.238223)*sailStates.alpha + (-0.029911)*sailStates.beta + (0.980313)*sailStates.p + (1.664522)*sailStates.q + (-0.195056)*sailStates.r + (0.000351)*sailStates.de;

	Cl = (1.031989)*sailStates.alpha + (-0.731596)*sailStates.beta + (-1.191556)*sailStates.p + (11.243879)*sailStates.q + (2.389894)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-9.465581)*sailStates.alpha + (2.471884)*sailStates.beta + (7.211667)*sailStates.p + (-136.195908)*sailStates.q + (-9.291088)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (-0.048450)*sailStates.alpha + (0.109505)*sailStates.beta + (-2.094780)*sailStates.p + (7.529449)*sailStates.q + (-0.011469)*sailStates.r + (-0.000281)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end