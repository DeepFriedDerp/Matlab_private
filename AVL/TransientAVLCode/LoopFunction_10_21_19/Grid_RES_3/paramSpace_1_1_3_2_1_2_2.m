function [aeroForces] = paramSpace_1_1_3_2_1_2_2(sailStates,airStates)

	CL = (3.869559)*sailStates.alpha + (-0.113315)*sailStates.beta + (-2.506689)*sailStates.p + (34.835094)*sailStates.q + (-0.667818)*sailStates.r + (0.010713)*sailStates.de;
	CD = 0.056410;
	CY = (-0.093948)*sailStates.alpha + (-0.023105)*sailStates.beta + (-0.056455)*sailStates.p + (-0.759371)*sailStates.q + (-0.010027)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.231711)*sailStates.alpha + (0.018770)*sailStates.beta + (-1.221952)*sailStates.p + (10.313809)*sailStates.q + (-0.416312)*sailStates.r + (0.000490)*sailStates.de;
	Cm = (-14.059093)*sailStates.alpha + (0.347474)*sailStates.beta + (8.503186)*sailStates.p + (-135.573257)*sailStates.q + (2.242992)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.247685)*sailStates.alpha + (0.005529)*sailStates.beta + (-0.018504)*sailStates.p + (1.225863)*sailStates.q + (-0.038801)*sailStates.r + (0.000198)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end