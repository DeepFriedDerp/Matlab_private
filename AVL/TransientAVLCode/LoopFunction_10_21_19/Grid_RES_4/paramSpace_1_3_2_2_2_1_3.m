function [aeroForces] = paramSpace_1_3_2_2_2_1_3(sailStates,airStates)

	CL = (4.427536)*sailStates.alpha + (0.158810)*sailStates.beta + (-2.944365)*sailStates.p + (42.211536)*sailStates.q + (-2.169661)*sailStates.r + (0.011506)*sailStates.de;
	CD = -0.493440;
	CY = (-0.087156)*sailStates.alpha + (-0.024646)*sailStates.beta + (-0.745490)*sailStates.p + (0.301044)*sailStates.q + (-0.148298)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.493695)*sailStates.alpha + (0.408917)*sailStates.beta + (-1.489570)*sailStates.p + (13.723310)*sailStates.q + (-1.762229)*sailStates.r + (0.000805)*sailStates.de;
	Cm = (-12.054007)*sailStates.alpha + (-0.597195)*sailStates.beta + (8.748693)*sailStates.p + (-145.703583)*sailStates.q + (7.220715)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.455972)*sailStates.alpha + (0.071360)*sailStates.beta + (1.425543)*sailStates.p + (-5.586193)*sailStates.q + (-0.008062)*sailStates.r + (-0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end