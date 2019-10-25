function [aeroForces] = paramSpace_2_1_1_1_2_1_2(sailStates,airStates)

	CL = (6.371390)*sailStates.alpha + (-0.485913)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (-2.229899)*sailStates.r + (0.010964)*sailStates.de;
	CD = -2.312360;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-1.072171)*sailStates.p + (-0.000000)*sailStates.q + (0.000000)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.925000)*sailStates.alpha + (0.402765)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (-2.109720)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.646000)*sailStates.alpha + (1.974349)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (7.615390)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (-0.337245)*sailStates.alpha + (0.000173)*sailStates.beta + (2.388226)*sailStates.p + (-10.750128)*sailStates.q + (-0.000303)*sailStates.r + (-0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end