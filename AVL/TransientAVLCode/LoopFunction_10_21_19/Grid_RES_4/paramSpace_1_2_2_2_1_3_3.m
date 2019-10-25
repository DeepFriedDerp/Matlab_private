function [aeroForces] = paramSpace_1_2_2_2_1_3_3(sailStates,airStates)

	CL = (4.175948)*sailStates.alpha + (0.008963)*sailStates.beta + (-2.812298)*sailStates.p + (34.882336)*sailStates.q + (0.069551)*sailStates.r + (0.010074)*sailStates.de;
	CD = -0.376220;
	CY = (0.001378)*sailStates.alpha + (-0.024476)*sailStates.beta + (0.312050)*sailStates.p + (-0.455225)*sailStates.q + (0.062087)*sailStates.r + (-0.000097)*sailStates.de;

	Cl = (1.496825)*sailStates.alpha + (-0.137944)*sailStates.beta + (-1.486154)*sailStates.p + (12.178697)*sailStates.q + (0.287365)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-14.837246)*sailStates.alpha + (-0.038853)*sailStates.beta + (10.345125)*sailStates.p + (-146.782669)*sailStates.q + (-0.128365)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (0.200020)*sailStates.alpha + (-0.031408)*sailStates.beta + (-0.967063)*sailStates.p + (5.776396)*sailStates.q + (-0.076437)*sailStates.r + (0.000218)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end