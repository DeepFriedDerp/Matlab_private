function [aeroForces] = paramSpace_4_2_3_1_1_2_2(sailStates,airStates)

	CL = (4.172588)*sailStates.alpha + (0.092032)*sailStates.beta + (-2.430690)*sailStates.p + (35.580524)*sailStates.q + (1.416692)*sailStates.r + (0.010583)*sailStates.de;
	CD = -0.029050;
	CY = (-0.221536)*sailStates.alpha + (-0.026804)*sailStates.beta + (0.493396)*sailStates.p + (-1.664521)*sailStates.q + (-0.098202)*sailStates.r + (-0.000352)*sailStates.de;

	Cl = (1.499649)*sailStates.alpha + (-0.149492)*sailStates.beta + (-1.148108)*sailStates.p + (10.193140)*sailStates.q + (1.041988)*sailStates.r + (0.000263)*sailStates.de;
	Cm = (-13.845181)*sailStates.alpha + (-0.334961)*sailStates.beta + (7.596742)*sailStates.p + (-132.472137)*sailStates.q + (-4.714162)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.162836)*sailStates.alpha + (0.037342)*sailStates.beta + (-0.874207)*sailStates.p + (4.434274)*sailStates.q + (0.012114)*sailStates.r + (0.000532)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end