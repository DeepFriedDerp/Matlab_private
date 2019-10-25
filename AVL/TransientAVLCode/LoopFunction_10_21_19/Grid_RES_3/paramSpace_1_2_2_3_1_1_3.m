function [aeroForces] = paramSpace_1_2_2_3_1_1_3(sailStates,airStates)

	CL = (4.061857)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.813197)*sailStates.p + (39.373760)*sailStates.q + (-1.503397)*sailStates.r + (0.011294)*sailStates.de;
	CD = -0.133200;
	CY = (-0.092074)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.451833)*sailStates.p + (-0.318253)*sailStates.q + (-0.079670)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.291800)*sailStates.alpha + (0.238611)*sailStates.beta + (-1.404223)*sailStates.p + (12.392261)*sailStates.q + (-1.187075)*sailStates.r + (0.000702)*sailStates.de;
	Cm = (-12.943505)*sailStates.alpha + (0.000000)*sailStates.beta + (8.904722)*sailStates.p + (-143.204193)*sailStates.q + (5.035545)*sailStates.r + (-0.069165)*sailStates.de;
	Cn = (0.288732)*sailStates.alpha + (0.042074)*sailStates.beta + (0.820480)*sailStates.p + (-2.643982)*sailStates.q + (-0.020982)*sailStates.r + (0.000014)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end