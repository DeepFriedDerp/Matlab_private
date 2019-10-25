function [aeroForces] = paramSpace_2_2_4_1_3_2_1(sailStates,airStates)

	CL = (3.930624)*sailStates.alpha + (-0.027781)*sailStates.beta + (-1.665157)*sailStates.p + (27.870232)*sailStates.q + (-0.648754)*sailStates.r + (0.010691)*sailStates.de;
	CD = -0.036730;
	CY = (0.293643)*sailStates.alpha + (-0.025345)*sailStates.beta + (-0.291434)*sailStates.p + (1.471502)*sailStates.q + (-0.018946)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (0.762370)*sailStates.alpha + (0.072670)*sailStates.beta + (-0.491188)*sailStates.p + (3.310555)*sailStates.q + (-0.461505)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-13.954953)*sailStates.alpha + (0.068742)*sailStates.beta + (5.612887)*sailStates.p + (-112.102478)*sailStates.q + (2.155905)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-0.638062)*sailStates.alpha + (0.006121)*sailStates.beta + (0.604120)*sailStates.p + (-3.944742)*sailStates.q + (0.010959)*sailStates.r + (-0.000466)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end