function [aeroForces] = paramSpace_2_1_4_3_3_3_3(sailStates,airStates)

	CL = (4.093131)*sailStates.alpha + (0.092665)*sailStates.beta + (-2.785723)*sailStates.p + (36.033119)*sailStates.q + (0.170877)*sailStates.r + (0.010889)*sailStates.de;
	CD = -0.117340;
	CY = (0.086881)*sailStates.alpha + (-0.025209)*sailStates.beta + (0.164584)*sailStates.p + (0.563441)*sailStates.q + (0.010847)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.390188)*sailStates.alpha + (-0.093633)*sailStates.beta + (-1.451969)*sailStates.p + (12.090496)*sailStates.q + (0.282262)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.634102)*sailStates.alpha + (-0.474103)*sailStates.beta + (9.651691)*sailStates.p + (-143.062866)*sailStates.q + (-0.620288)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (-0.017583)*sailStates.alpha + (-0.007719)*sailStates.beta + (-0.454460)*sailStates.p + (1.835867)*sailStates.q + (-0.005448)*sailStates.r + (-0.000141)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end