function [aeroForces] = paramSpace_1_1_2_1_3_1_2(sailStates,airStates)

	CL = (7.770253)*sailStates.alpha + (-0.679475)*sailStates.beta + (-2.593637)*sailStates.p + (42.309395)*sailStates.q + (-3.549584)*sailStates.r + (0.011992)*sailStates.de;
	CD = -3.051280;
	CY = (0.252690)*sailStates.alpha + (-0.029042)*sailStates.beta + (-1.499907)*sailStates.p + (1.671349)*sailStates.q + (-0.264474)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (3.053872)*sailStates.alpha + (0.471938)*sailStates.beta + (-1.229679)*sailStates.p + (12.293240)*sailStates.q + (-3.046631)*sailStates.r + (0.000345)*sailStates.de;
	Cm = (-12.686647)*sailStates.alpha + (2.546325)*sailStates.beta + (6.440008)*sailStates.p + (-132.498779)*sailStates.q + (11.777674)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (-0.367001)*sailStates.alpha + (0.131078)*sailStates.beta + (3.173914)*sailStates.p + (-14.873951)*sailStates.q + (0.060676)*sailStates.r + (-0.000728)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end