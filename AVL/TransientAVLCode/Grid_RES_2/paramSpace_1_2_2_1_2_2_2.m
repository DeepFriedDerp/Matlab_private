function [aeroForces] = paramSpace_1_2_2_1_2_2_2(sailStates,airStates)

	CL = (8.437805)*sailStates.alpha + (-0.597390)*sailStates.beta + (-2.567078)*sailStates.p + (28.995787)*sailStates.q + (0.380001)*sailStates.r + (0.008638)*sailStates.de;
	CD = -5.727480;
	CY = (2.065149)*sailStates.alpha + (-0.003059)*sailStates.beta + (-0.246731)*sailStates.p + (16.847221)*sailStates.q + (-0.027710)*sailStates.r + (0.003588)*sailStates.de;

	Cl = (-2.533684)*sailStates.alpha + (-0.572993)*sailStates.beta + (-1.381855)*sailStates.p + (11.392193)*sailStates.q + (1.095331)*sailStates.r + (0.000334)*sailStates.de;
	Cm = (-12.439795)*sailStates.alpha + (2.895927)*sailStates.beta + (9.303157)*sailStates.p + (-137.975021)*sailStates.q + (-1.568485)*sailStates.r + (-0.068390)*sailStates.de;
	Cn = (-2.215838)*sailStates.alpha + (-0.082663)*sailStates.beta + (-0.089322)*sailStates.p + (-11.821926)*sailStates.q + (0.146669)*sailStates.r + (-0.004783)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end