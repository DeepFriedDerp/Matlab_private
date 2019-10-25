function [aeroForces] = paramSpace_1_2_2_1_3_3_1(sailStates,airStates)

	CL = (4.670433)*sailStates.alpha + (0.098597)*sailStates.beta + (-1.408628)*sailStates.p + (20.383427)*sailStates.q + (1.179076)*sailStates.r + (0.008656)*sailStates.de;
	CD = -1.575860;
	CY = (-0.136395)*sailStates.alpha + (-0.026077)*sailStates.beta + (0.643961)*sailStates.p + (1.002332)*sailStates.q + (0.128056)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (0.431277)*sailStates.alpha + (-0.332305)*sailStates.beta + (-0.394828)*sailStates.p + (1.361885)*sailStates.q + (1.327623)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-14.772202)*sailStates.alpha + (-0.386007)*sailStates.beta + (6.317984)*sailStates.p + (-108.591942)*sailStates.q + (-3.833031)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (1.342932)*sailStates.alpha + (-0.073399)*sailStates.beta + (-1.554559)*sailStates.p + (6.267541)*sailStates.q + (-0.029458)*sailStates.r + (-0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end