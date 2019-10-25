function [aeroForces] = paramSpace_1_3_2_1_3_1_2(sailStates,airStates)

	CL = (7.770253)*sailStates.alpha + (0.679474)*sailStates.beta + (-2.593637)*sailStates.p + (42.309395)*sailStates.q + (-3.549584)*sailStates.r + (0.011992)*sailStates.de;
	CD = -3.051280;
	CY = (0.252690)*sailStates.alpha + (-0.020620)*sailStates.beta + (-1.499907)*sailStates.p + (1.671349)*sailStates.q + (-0.264474)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (2.949428)*sailStates.alpha + (0.882716)*sailStates.beta + (-1.145043)*sailStates.p + (11.232371)*sailStates.q + (-3.031707)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-12.686647)*sailStates.alpha + (-2.546325)*sailStates.beta + (6.440008)*sailStates.p + (-132.498779)*sailStates.q + (11.777674)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (-0.549000)*sailStates.alpha + (0.107784)*sailStates.beta + (3.188837)*sailStates.p + (-15.061009)*sailStates.q + (0.063307)*sailStates.r + (-0.000728)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end