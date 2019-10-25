function [aeroForces] = paramSpace_1_3_3_1_1_1_2(sailStates,airStates)

	CL = (5.523618)*sailStates.alpha + (0.220071)*sailStates.beta + (-2.699646)*sailStates.p + (42.915680)*sailStates.q + (-2.807930)*sailStates.r + (0.012262)*sailStates.de;
	CD = -1.835140;
	CY = (-0.239836)*sailStates.alpha + (-0.026689)*sailStates.beta + (-0.981945)*sailStates.p + (-1.664520)*sailStates.q + (-0.195381)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (1.087439)*sailStates.alpha + (0.617317)*sailStates.beta + (-1.231832)*sailStates.p + (11.714725)*sailStates.q + (-2.401196)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-9.651585)*sailStates.alpha + (-0.827772)*sailStates.beta + (7.273896)*sailStates.p + (-137.222183)*sailStates.q + (9.316120)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.107160)*sailStates.alpha + (0.110731)*sailStates.beta + (2.090794)*sailStates.p + (-7.455923)*sailStates.q + (-0.012916)*sailStates.r + (0.000283)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end