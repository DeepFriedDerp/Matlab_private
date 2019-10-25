function [aeroForces] = paramSpace_1_2_2_2_2_1_3(sailStates,airStates)

	CL = (4.427536)*sailStates.alpha + (-0.158810)*sailStates.beta + (-2.944366)*sailStates.p + (42.211536)*sailStates.q + (-2.169662)*sailStates.r + (0.011506)*sailStates.de;
	CD = -0.493440;
	CY = (-0.087156)*sailStates.alpha + (-0.025307)*sailStates.beta + (-0.745490)*sailStates.p + (0.301044)*sailStates.q + (-0.148298)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.530739)*sailStates.alpha + (0.311534)*sailStates.beta + (-1.521108)*sailStates.p + (14.120277)*sailStates.q + (-1.768517)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-12.054006)*sailStates.alpha + (0.597195)*sailStates.beta + (8.748691)*sailStates.p + (-145.703583)*sailStates.q + (7.220716)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.496060)*sailStates.alpha + (0.071946)*sailStates.beta + (1.419270)*sailStates.p + (-5.507231)*sailStates.q + (-0.009312)*sailStates.r + (-0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end