function [aeroForces] = paramSpace_3_3_2_3_3_2_3(sailStates,airStates)

	CL = (4.021692)*sailStates.alpha + (-0.015181)*sailStates.beta + (-2.832043)*sailStates.p + (37.041573)*sailStates.q + (0.232978)*sailStates.r + (0.011186)*sailStates.de;
	CD = 0.028990;
	CY = (0.053742)*sailStates.alpha + (-0.025115)*sailStates.beta + (-0.001890)*sailStates.p + (0.432842)*sailStates.q + (0.000109)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.318503)*sailStates.alpha + (-0.021740)*sailStates.beta + (-1.407484)*sailStates.p + (11.548270)*sailStates.q + (0.137134)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.607816)*sailStates.alpha + (0.046121)*sailStates.beta + (9.684304)*sailStates.p + (-144.575439)*sailStates.q + (-0.783736)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.124547)*sailStates.alpha + (0.001424)*sailStates.beta + (0.065918)*sailStates.p + (-0.861424)*sailStates.q + (-0.007272)*sailStates.r + (-0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end