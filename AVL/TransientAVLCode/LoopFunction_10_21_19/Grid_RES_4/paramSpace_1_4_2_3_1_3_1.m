function [aeroForces] = paramSpace_1_4_2_3_1_3_1(sailStates,airStates)

	CL = (3.902989)*sailStates.alpha + (0.029530)*sailStates.beta + (-2.174812)*sailStates.p + (30.490795)*sailStates.q + (-0.095361)*sailStates.r + (0.009858)*sailStates.de;
	CD = -0.109810;
	CY = (-0.100959)*sailStates.alpha + (-0.027035)*sailStates.beta + (0.184663)*sailStates.p + (-0.684401)*sailStates.q + (0.036756)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.020563)*sailStates.alpha + (-0.063928)*sailStates.beta + (-0.894314)*sailStates.p + (6.616402)*sailStates.q + (0.124418)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-14.438676)*sailStates.alpha + (-0.110031)*sailStates.beta + (7.895247)*sailStates.p + (-127.495163)*sailStates.q + (0.397993)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.388830)*sailStates.alpha + (-0.005273)*sailStates.beta + (-0.551068)*sailStates.p + (3.457341)*sailStates.q + (-0.049536)*sailStates.r + (0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end