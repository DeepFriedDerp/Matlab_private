function [aeroForces] = paramSpace_4_1_3_3_3_1_1(sailStates,airStates)

	CL = (3.902989)*sailStates.alpha + (0.029530)*sailStates.beta + (-2.174812)*sailStates.p + (30.490795)*sailStates.q + (0.095361)*sailStates.r + (0.009858)*sailStates.de;
	CD = -0.109810;
	CY = (0.100959)*sailStates.alpha + (-0.022537)*sailStates.beta + (-0.184663)*sailStates.p + (0.684401)*sailStates.q + (0.036756)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.177263)*sailStates.alpha + (0.069150)*sailStates.beta + (-0.988687)*sailStates.p + (7.804278)*sailStates.q + (-0.105603)*sailStates.r + (0.000159)*sailStates.de;
	Cm = (-14.438676)*sailStates.alpha + (-0.110031)*sailStates.beta + (7.895247)*sailStates.p + (-127.495163)*sailStates.q + (-0.397993)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (-0.402320)*sailStates.alpha + (-0.021198)*sailStates.beta + (0.569840)*sailStates.p + (-3.693624)*sailStates.q + (-0.053278)*sailStates.r + (-0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end