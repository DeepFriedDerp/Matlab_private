function [aeroForces] = paramSpace_4_4_4_2_1_1_3(sailStates,airStates)

	CL = (3.866075)*sailStates.alpha + (-0.045428)*sailStates.beta + (-2.748043)*sailStates.p + (34.911289)*sailStates.q + (0.318815)*sailStates.r + (0.009821)*sailStates.de;
	CD = -0.162990;
	CY = (-0.136846)*sailStates.alpha + (-0.021092)*sailStates.beta + (-0.059027)*sailStates.p + (-1.057314)*sailStates.q + (0.011628)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.231170)*sailStates.alpha + (0.047329)*sailStates.beta + (-1.386200)*sailStates.p + (11.391870)*sailStates.q + (0.036223)*sailStates.r + (0.000660)*sailStates.de;
	Cm = (-14.044827)*sailStates.alpha + (0.187521)*sailStates.beta + (9.754766)*sailStates.p + (-143.598221)*sailStates.q + (-1.148247)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.084359)*sailStates.alpha + (-0.009695)*sailStates.beta + (0.428133)*sailStates.p + (-2.171484)*sailStates.q + (-0.037578)*sailStates.r + (0.000239)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end