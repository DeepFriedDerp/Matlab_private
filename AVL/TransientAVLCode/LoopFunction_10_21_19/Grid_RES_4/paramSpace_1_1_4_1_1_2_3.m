function [aeroForces] = paramSpace_1_1_4_1_1_2_3(sailStates,airStates)

	CL = (3.381298)*sailStates.alpha + (-0.160305)*sailStates.beta + (-3.364097)*sailStates.p + (41.930428)*sailStates.q + (-0.880719)*sailStates.r + (0.011071)*sailStates.de;
	CD = 0.078630;
	CY = (-0.137903)*sailStates.alpha + (-0.021908)*sailStates.beta + (-0.038788)*sailStates.p + (-1.002333)*sailStates.q + (-0.007823)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (1.250221)*sailStates.alpha + (-0.008145)*sailStates.beta + (-1.932215)*sailStates.p + (17.072409)*sailStates.q + (-0.576216)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-12.500087)*sailStates.alpha + (0.497027)*sailStates.beta + (11.448700)*sailStates.p + (-160.076126)*sailStates.q + (2.966038)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (0.447740)*sailStates.alpha + (0.000424)*sailStates.beta + (-0.213898)*sailStates.p + (3.072613)*sailStates.q + (-0.080857)*sailStates.r + (0.000259)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end