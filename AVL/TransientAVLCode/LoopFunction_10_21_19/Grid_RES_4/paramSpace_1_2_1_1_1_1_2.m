function [aeroForces] = paramSpace_1_2_1_1_1_1_2(sailStates,airStates)

	CL = (5.486308)*sailStates.alpha + (-0.234282)*sailStates.beta + (-2.698108)*sailStates.p + (43.013058)*sailStates.q + (-2.825518)*sailStates.r + (0.012086)*sailStates.de;
	CD = -1.858210;
	CY = (-0.239795)*sailStates.alpha + (-0.023033)*sailStates.beta + (-1.010965)*sailStates.p + (-1.664525)*sailStates.q + (-0.200915)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (1.108775)*sailStates.alpha + (0.509408)*sailStates.beta + (-1.262678)*sailStates.p + (12.116138)*sailStates.q + (-2.454489)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-9.228774)*sailStates.alpha + (0.916586)*sailStates.beta + (7.254114)*sailStates.p + (-137.222183)*sailStates.q + (9.415576)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.167256)*sailStates.alpha + (0.113188)*sailStates.beta + (2.128327)*sailStates.p + (-7.399292)*sailStates.q + (-0.015559)*sailStates.r + (0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end