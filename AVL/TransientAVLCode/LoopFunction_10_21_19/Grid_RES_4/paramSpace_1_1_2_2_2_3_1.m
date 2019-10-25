function [aeroForces] = paramSpace_1_1_2_2_2_3_1(sailStates,airStates)

	CL = (4.025626)*sailStates.alpha + (0.044590)*sailStates.beta + (-1.996354)*sailStates.p + (28.132565)*sailStates.q + (0.195914)*sailStates.r + (0.009546)*sailStates.de;
	CD = -0.315710;
	CY = (-0.084666)*sailStates.alpha + (-0.023797)*sailStates.beta + (0.289402)*sailStates.p + (-0.301044)*sailStates.q + (0.057576)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.098463)*sailStates.alpha + (-0.115500)*sailStates.beta + (-0.858815)*sailStates.p + (6.412592)*sailStates.q + (0.383025)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-14.713264)*sailStates.alpha + (-0.178815)*sailStates.beta + (7.522444)*sailStates.p + (-122.964470)*sailStates.q + (-0.569104)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.508669)*sailStates.alpha + (-0.033706)*sailStates.beta + (-0.795509)*sailStates.p + (4.297163)*sailStates.q + (-0.048096)*sailStates.r + (0.000153)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end