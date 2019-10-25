function [aeroForces] = paramSpace_2_3_4_1_3_3_1(sailStates,airStates)

	CL = (5.162114)*sailStates.alpha + (-0.145233)*sailStates.beta + (-1.607170)*sailStates.p + (25.211027)*sailStates.q + (1.573187)*sailStates.r + (0.010162)*sailStates.de;
	CD = -1.764600;
	CY = (-0.103029)*sailStates.alpha + (-0.024607)*sailStates.beta + (0.758552)*sailStates.p + (1.471502)*sailStates.q + (0.049873)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (0.443864)*sailStates.alpha + (-0.473405)*sailStates.beta + (-0.440196)*sailStates.p + (2.204591)*sailStates.q + (1.619622)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-13.777675)*sailStates.alpha + (0.610529)*sailStates.beta + (6.106552)*sailStates.p + (-112.102478)*sailStates.q + (-5.375958)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (1.436291)*sailStates.alpha + (-0.028147)*sailStates.beta + (-1.751387)*sailStates.p + (6.740522)*sailStates.q + (-0.007340)*sailStates.r + (-0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end