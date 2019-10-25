function [aeroForces] = paramSpace_4_2_2_1_1_1_2(sailStates,airStates)

	CL = (5.108066)*sailStates.alpha + (-0.089446)*sailStates.beta + (-2.261371)*sailStates.p + (27.599886)*sailStates.q + (-0.843645)*sailStates.r + (0.009101)*sailStates.de;
	CD = -1.551870;
	CY = (-0.183970)*sailStates.alpha + (-0.026689)*sailStates.beta + (-0.553044)*sailStates.p + (-1.664519)*sailStates.q + (0.110067)*sailStates.r + (-0.000352)*sailStates.de;

	Cl = (1.128628)*sailStates.alpha + (0.323968)*sailStates.beta + (-1.094688)*sailStates.p + (8.096671)*sailStates.q + (-1.070003)*sailStates.r + (0.000263)*sailStates.de;
	Cm = (-15.725692)*sailStates.alpha + (0.376939)*sailStates.beta + (9.078845)*sailStates.p + (-132.472137)*sailStates.q + (2.736872)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.304279)*sailStates.alpha + (-0.070130)*sailStates.beta + (1.495678)*sailStates.p + (-6.105387)*sailStates.q + (-0.041517)*sailStates.r + (0.000348)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end