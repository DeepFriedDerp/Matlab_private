function [aeroForces] = paramSpace_2_2_2_1_1_2_2(sailStates,airStates)

	CL = (5.208168)*sailStates.alpha + (-0.342387)*sailStates.beta + (-3.076228)*sailStates.p + (42.343330)*sailStates.q + (2.343829)*sailStates.r + (0.011630)*sailStates.de;
	CD = -1.035790;
	CY = (0.038712)*sailStates.alpha + (-0.022990)*sailStates.beta + (0.962966)*sailStates.p + (-1.226113)*sailStates.q + (-0.126864)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (1.974717)*sailStates.alpha + (-0.534847)*sailStates.beta + (-1.575868)*sailStates.p + (14.121469)*sailStates.q + (1.989602)*sailStates.r + (0.000875)*sailStates.de;
	Cm = (-13.265732)*sailStates.alpha + (1.322266)*sailStates.beta + (9.373260)*sailStates.p + (-148.931046)*sailStates.q + (-7.879900)*sailStates.r + (-0.070142)*sailStates.de;
	Cn = (-0.480389)*sailStates.alpha + (0.053044)*sailStates.beta + (-1.941722)*sailStates.p + (8.918938)*sailStates.q + (0.020980)*sailStates.r + (0.000515)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end