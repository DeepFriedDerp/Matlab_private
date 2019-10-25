function [aeroForces] = paramSpace_2_1_2_2_1_2_1(sailStates,airStates)

	CL = (5.713147)*sailStates.alpha + (-1.919717)*sailStates.beta + (-3.648667)*sailStates.p + (50.048386)*sailStates.q + (2.125680)*sailStates.r + (0.012602)*sailStates.de;
	CD = -5.358660;
	CY = (1.890727)*sailStates.alpha + (-0.130886)*sailStates.beta + (0.277651)*sailStates.p + (14.958509)*sailStates.q + (-0.029137)*sailStates.r + (0.003165)*sailStates.de;

	Cl = (-4.607746)*sailStates.alpha + (-1.001232)*sailStates.beta + (-1.844751)*sailStates.p + (15.915471)*sailStates.q + (2.343490)*sailStates.r + (0.001567)*sailStates.de;
	Cm = (1.965036)*sailStates.alpha + (8.641471)*sailStates.beta + (11.480766)*sailStates.p + (-163.670593)*sailStates.q + (-7.526566)*sailStates.r + (-0.068134)*sailStates.de;
	Cn = (-2.099595)*sailStates.alpha + (0.216788)*sailStates.beta + (-0.800304)*sailStates.p + (-8.899651)*sailStates.q + (-0.189466)*sailStates.r + (-0.004150)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end