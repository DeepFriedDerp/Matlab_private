function [aeroForces] = paramSpace_1_2_2_1_3_2_3(sailStates,airStates)

	CL = (3.916001)*sailStates.alpha + (-0.107854)*sailStates.beta + (-3.282788)*sailStates.p + (42.845524)*sailStates.q + (-1.760273)*sailStates.r + (0.011027)*sailStates.de;
	CD = -0.021530;
	CY = (0.087343)*sailStates.alpha + (-0.027531)*sailStates.beta + (-0.598733)*sailStates.p + (2.326710)*sailStates.q + (-0.119179)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (1.686741)*sailStates.alpha + (0.164825)*sailStates.beta + (-1.847613)*sailStates.p + (16.930151)*sailStates.q + (-1.323089)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-13.131656)*sailStates.alpha + (0.388281)*sailStates.beta + (10.348043)*sailStates.p + (-156.352325)*sailStates.q + (5.858365)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (0.584904)*sailStates.alpha + (0.042140)*sailStates.beta + (0.954807)*sailStates.p + (-4.607635)*sailStates.q + (-0.000057)*sailStates.r + (-0.000749)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end