function [aeroForces] = paramSpace_9_1_4_2_2_2_1(sailStates,airStates)

	CL = (4.155325)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.371738)*sailStates.p + (33.585949)*sailStates.q + (0.604926)*sailStates.r + (0.011042)*sailStates.de;
	CD = -0.083740;
	CY = (0.033345)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.245993)*sailStates.p + (0.438540)*sailStates.q + (-0.008544)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.145683)*sailStates.alpha + (-0.140748)*sailStates.beta + (-1.041579)*sailStates.p + (8.250491)*sailStates.q + (0.560284)*sailStates.r + (0.000068)*sailStates.de;
	Cm = (-14.520501)*sailStates.alpha + (0.000000)*sailStates.beta + (8.057972)*sailStates.p + (-131.751755)*sailStates.q + (-2.091071)*sailStates.r + (-0.069836)*sailStates.de;
	Cn = (0.097882)*sailStates.alpha + (0.004915)*sailStates.beta + (-0.517954)*sailStates.p + (1.806984)*sailStates.q + (-0.000572)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end