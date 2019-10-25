function [aeroForces] = paramSpace_3_3_2_3_3_3_2(sailStates,airStates)

	CL = (4.208773)*sailStates.alpha + (-0.064464)*sailStates.beta + (-2.588823)*sailStates.p + (35.714081)*sailStates.q + (0.851525)*sailStates.r + (0.011214)*sailStates.de;
	CD = -0.137290;
	CY = (0.063135)*sailStates.alpha + (-0.025136)*sailStates.beta + (0.295917)*sailStates.p + (0.498141)*sailStates.q + (-0.019413)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.224992)*sailStates.alpha + (-0.186349)*sailStates.beta + (-1.200281)*sailStates.p + (9.781751)*sailStates.q + (0.719863)*sailStates.r + (0.000312)*sailStates.de;
	Cm = (-14.331822)*sailStates.alpha + (0.240398)*sailStates.beta + (8.670513)*sailStates.p + (-137.428818)*sailStates.q + (-2.882389)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.001008)*sailStates.alpha + (0.011003)*sailStates.beta + (-0.618741)*sailStates.p + (2.266652)*sailStates.q + (-0.001468)*sailStates.r + (-0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end