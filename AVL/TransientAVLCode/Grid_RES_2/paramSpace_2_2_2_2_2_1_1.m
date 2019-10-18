function [aeroForces] = paramSpace_2_2_2_2_2_1_1(sailStates,airStates)

	CL = (5.411517)*sailStates.alpha + (-4.127565)*sailStates.beta + (-3.482570)*sailStates.p + (48.023933)*sailStates.q + (2.371303)*sailStates.r + (0.010475)*sailStates.de;
	CD = -6.460280;
	CY = (1.829069)*sailStates.alpha + (-0.273822)*sailStates.beta + (0.400366)*sailStates.p + (15.568913)*sailStates.q + (-0.041682)*sailStates.r + (0.002965)*sailStates.de;

	Cl = (-5.893200)*sailStates.alpha + (-1.323899)*sailStates.beta + (-1.694971)*sailStates.p + (14.491585)*sailStates.q + (2.620420)*sailStates.r + (0.001255)*sailStates.de;
	Cm = (7.009069)*sailStates.alpha + (18.790325)*sailStates.beta + (10.736911)*sailStates.p + (-152.120209)*sailStates.q + (-8.419357)*sailStates.r + (-0.055361)*sailStates.de;
	Cn = (-1.945839)*sailStates.alpha + (0.391695)*sailStates.beta + (-1.092332)*sailStates.p + (-8.108009)*sailStates.q + (-0.201305)*sailStates.r + (-0.003889)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end