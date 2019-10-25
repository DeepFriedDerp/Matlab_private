function [aeroForces] = paramSpace_2_4_2_1_1_1_2(sailStates,airStates)

	CL = (5.542412)*sailStates.alpha + (0.536735)*sailStates.beta + (-2.622024)*sailStates.p + (37.276787)*sailStates.q + (-2.115097)*sailStates.r + (0.011393)*sailStates.de;
	CD = -1.824550;
	CY = (-0.219584)*sailStates.alpha + (-0.026772)*sailStates.beta + (-0.858667)*sailStates.p + (-1.693498)*sailStates.q + (-0.056220)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (1.077471)*sailStates.alpha + (0.630672)*sailStates.beta + (-1.178887)*sailStates.p + (9.780718)*sailStates.q + (-1.953300)*sailStates.r + (0.000247)*sailStates.de;
	Cm = (-12.310315)*sailStates.alpha + (-2.142337)*sailStates.beta + (8.389076)*sailStates.p + (-136.946671)*sailStates.q + (7.202174)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (-0.107221)*sailStates.alpha + (0.031839)*sailStates.beta + (1.910616)*sailStates.p + (-7.184942)*sailStates.q + (0.002117)*sailStates.r + (0.000324)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end