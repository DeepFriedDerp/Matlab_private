function [aeroForces] = paramSpace_3_1_1_1_3_1_1(sailStates,airStates)

	CL = (6.998489)*sailStates.alpha + (-0.557559)*sailStates.beta + (-1.621729)*sailStates.p + (24.758030)*sailStates.q + (-2.460452)*sailStates.r + (0.010004)*sailStates.de;
	CD = -2.881670;
	CY = (0.699465)*sailStates.alpha + (-0.023349)*sailStates.beta + (-1.306590)*sailStates.p + (1.915492)*sailStates.q + (0.085436)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (2.154342)*sailStates.alpha + (0.408715)*sailStates.beta + (-0.517396)*sailStates.p + (2.877175)*sailStates.q + (-2.339652)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-16.607250)*sailStates.alpha + (2.246031)*sailStates.beta + (6.428751)*sailStates.p + (-112.650780)*sailStates.q + (8.338262)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-2.589902)*sailStates.alpha + (-0.042484)*sailStates.beta + (2.880736)*sailStates.p + (-14.400183)*sailStates.q + (-0.033308)*sailStates.r + (-0.000736)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end