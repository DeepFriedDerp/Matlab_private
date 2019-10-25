function [aeroForces] = paramSpace_2_4_4_3_3_3_3(sailStates,airStates)

	CL = (4.093132)*sailStates.alpha + (-0.092665)*sailStates.beta + (-2.785723)*sailStates.p + (36.033119)*sailStates.q + (0.170877)*sailStates.r + (0.010889)*sailStates.de;
	CD = -0.117340;
	CY = (0.086881)*sailStates.alpha + (-0.024364)*sailStates.beta + (0.164584)*sailStates.p + (0.563441)*sailStates.q + (0.010847)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.248944)*sailStates.alpha + (-0.115610)*sailStates.beta + (-1.354265)*sailStates.p + (10.881937)*sailStates.q + (0.288539)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.634103)*sailStates.alpha + (0.474103)*sailStates.beta + (9.651691)*sailStates.p + (-143.062881)*sailStates.q + (-0.620287)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.000705)*sailStates.alpha + (-0.005996)*sailStates.beta + (-0.448056)*sailStates.p + (1.756654)*sailStates.q + (-0.005036)*sailStates.r + (-0.000141)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end