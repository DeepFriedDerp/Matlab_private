function [aeroForces] = paramSpace_1_3_1_1_1_1_2(sailStates,airStates)

	CL = (5.486308)*sailStates.alpha + (0.234282)*sailStates.beta + (-2.698108)*sailStates.p + (43.013058)*sailStates.q + (-2.825517)*sailStates.r + (0.012086)*sailStates.de;
	CD = -1.858210;
	CY = (-0.239795)*sailStates.alpha + (-0.026920)*sailStates.beta + (-1.010965)*sailStates.p + (-1.664525)*sailStates.q + (-0.200915)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (1.071425)*sailStates.alpha + (0.632223)*sailStates.beta + (-1.231146)*sailStates.p + (11.719167)*sailStates.q + (-2.448174)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-9.228774)*sailStates.alpha + (-0.916586)*sailStates.beta + (7.254113)*sailStates.p + (-137.222183)*sailStates.q + (9.415576)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.107989)*sailStates.alpha + (0.113897)*sailStates.beta + (2.134599)*sailStates.p + (-7.478255)*sailStates.q + (-0.014303)*sailStates.r + (0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end