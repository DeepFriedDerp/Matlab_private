function [aeroForces] = paramSpace_2_1_1_2_1_1_2(sailStates,airStates)

	CL = (4.322583)*sailStates.alpha + (-0.308781)*sailStates.beta + (-2.580832)*sailStates.p + (35.892735)*sailStates.q + (-1.152209)*sailStates.r + (0.011071)*sailStates.de;
	CD = -0.368460;
	CY = (-0.097457)*sailStates.alpha + (-0.023721)*sailStates.beta + (-0.449783)*sailStates.p + (-0.769434)*sailStates.q + (-0.029399)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.285867)*sailStates.alpha + (0.177829)*sailStates.beta + (-1.260657)*sailStates.p + (10.622935)*sailStates.q + (-1.045885)*sailStates.r + (0.000486)*sailStates.de;
	Cm = (-13.672183)*sailStates.alpha + (1.283262)*sailStates.beta + (8.549168)*sailStates.p + (-136.512222)*sailStates.q + (3.946903)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (0.036071)*sailStates.alpha + (0.016365)*sailStates.beta + (0.946033)*sailStates.p + (-3.345068)*sailStates.q + (-0.001565)*sailStates.r + (0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end