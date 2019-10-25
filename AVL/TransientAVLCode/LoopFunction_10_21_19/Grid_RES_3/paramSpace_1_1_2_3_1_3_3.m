function [aeroForces] = paramSpace_1_1_2_3_1_3_3(sailStates,airStates)

	CL = (3.967006)*sailStates.alpha + (-0.021492)*sailStates.beta + (-2.707050)*sailStates.p + (34.988949)*sailStates.q + (-0.178922)*sailStates.r + (0.010322)*sailStates.de;
	CD = -0.116180;
	CY = (-0.020394)*sailStates.alpha + (-0.024029)*sailStates.beta + (0.158102)*sailStates.p + (-0.318252)*sailStates.q + (0.027878)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.395491)*sailStates.alpha + (-0.079501)*sailStates.beta + (-1.410372)*sailStates.p + (11.761066)*sailStates.q + (0.034835)*sailStates.r + (0.000809)*sailStates.de;
	Cm = (-14.493961)*sailStates.alpha + (0.046646)*sailStates.beta + (9.618267)*sailStates.p + (-142.287766)*sailStates.q + (0.649879)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.230806)*sailStates.alpha + (-0.018379)*sailStates.beta + (-0.569216)*sailStates.p + (3.662403)*sailStates.q + (-0.050376)*sailStates.r + (0.000136)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end