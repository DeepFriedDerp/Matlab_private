function [aeroForces] = paramSpace_4_3_2_3_1_3_3(sailStates,airStates)

	CL = (4.322339)*sailStates.alpha + (-0.127015)*sailStates.beta + (-2.766697)*sailStates.p + (39.804493)*sailStates.q + (1.869463)*sailStates.r + (0.011265)*sailStates.de;
	CD = -0.255310;
	CY = (-0.023238)*sailStates.alpha + (-0.024272)*sailStates.beta + (0.626235)*sailStates.p + (-0.684402)*sailStates.q + (-0.124541)*sailStates.r + (-0.000146)*sailStates.de;

	Cl = (1.498637)*sailStates.alpha + (-0.326903)*sailStates.beta + (-1.360070)*sailStates.p + (12.329404)*sailStates.q + (1.461115)*sailStates.r + (0.000589)*sailStates.de;
	Cm = (-12.993748)*sailStates.alpha + (0.456133)*sailStates.beta + (8.386060)*sailStates.p + (-141.172913)*sailStates.q + (-6.202495)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (-0.184927)*sailStates.alpha + (0.056256)*sailStates.beta + (-1.177991)*sailStates.p + (4.971520)*sailStates.q + (-0.002567)*sailStates.r + (0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end