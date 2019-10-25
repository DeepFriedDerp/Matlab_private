function [aeroForces] = paramSpace_1_3_2_1_3_2_2(sailStates,airStates)

	CL = (4.172588)*sailStates.alpha + (0.092032)*sailStates.beta + (-2.430690)*sailStates.p + (35.580524)*sailStates.q + (-1.416693)*sailStates.r + (0.010583)*sailStates.de;
	CD = -0.029050;
	CY = (0.221536)*sailStates.alpha + (-0.023148)*sailStates.beta + (-0.493396)*sailStates.p + (1.664521)*sailStates.q + (-0.098202)*sailStates.r + (0.000352)*sailStates.de;

	Cl = (1.453082)*sailStates.alpha + (0.210884)*sailStates.beta + (-1.116570)*sailStates.p + (9.796171)*sailStates.q + (-1.035701)*sailStates.r + (0.000178)*sailStates.de;
	Cm = (-13.845181)*sailStates.alpha + (-0.334961)*sailStates.beta + (7.596742)*sailStates.p + (-132.472137)*sailStates.q + (4.714162)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.188476)*sailStates.alpha + (0.034342)*sailStates.beta + (0.880480)*sailStates.p + (-4.513237)*sailStates.q + (0.013365)*sailStates.r + (-0.000532)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end