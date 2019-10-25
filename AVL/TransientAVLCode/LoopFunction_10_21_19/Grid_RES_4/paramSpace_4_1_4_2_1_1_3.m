function [aeroForces] = paramSpace_4_1_4_2_1_1_3(sailStates,airStates)

	CL = (3.866074)*sailStates.alpha + (0.045428)*sailStates.beta + (-2.748043)*sailStates.p + (34.911285)*sailStates.q + (0.318815)*sailStates.r + (0.009821)*sailStates.de;
	CD = -0.162990;
	CY = (-0.136846)*sailStates.alpha + (-0.028480)*sailStates.beta + (-0.059027)*sailStates.p + (-1.057314)*sailStates.q + (0.011628)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.364565)*sailStates.alpha + (0.098610)*sailStates.beta + (-1.480557)*sailStates.p + (12.579754)*sailStates.q + (0.055119)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-14.044828)*sailStates.alpha + (-0.187521)*sailStates.beta + (9.754766)*sailStates.p + (-143.598221)*sailStates.q + (-1.148247)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.091488)*sailStates.alpha + (-0.019334)*sailStates.beta + (0.446902)*sailStates.p + (-2.407768)*sailStates.q + (-0.041337)*sailStates.r + (0.000239)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end