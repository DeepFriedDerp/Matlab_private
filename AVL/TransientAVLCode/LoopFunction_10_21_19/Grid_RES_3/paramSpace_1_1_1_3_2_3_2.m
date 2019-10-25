function [aeroForces] = paramSpace_1_1_1_3_2_3_2(sailStates,airStates)

	CL = (3.899634)*sailStates.alpha + (-0.050313)*sailStates.beta + (-2.440361)*sailStates.p + (32.988392)*sailStates.q + (-0.226556)*sailStates.r + (0.010091)*sailStates.de;
	CD = -0.053720;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.087991)*sailStates.p + (0.000000)*sailStates.q + (0.015515)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.276050)*sailStates.alpha + (-0.057968)*sailStates.beta + (-1.194520)*sailStates.p + (9.806914)*sailStates.q + (-0.026526)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-14.315269)*sailStates.alpha + (0.219234)*sailStates.beta + (8.633497)*sailStates.p + (-134.612778)*sailStates.q + (0.827218)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.231769)*sailStates.alpha + (-0.012658)*sailStates.beta + (-0.396670)*sailStates.p + (2.577969)*sailStates.q + (-0.037668)*sailStates.r + (0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end