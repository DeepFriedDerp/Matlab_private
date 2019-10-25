function [aeroForces] = paramSpace_12_1_2_2_2_2_2(sailStates,airStates)

	CL = (4.087710)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.779352)*sailStates.p + (38.188847)*sailStates.q + (1.197682)*sailStates.r + (0.011293)*sailStates.de;
	CD = -0.083800;
	CY = (0.070000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.357358)*sailStates.p + (0.291853)*sailStates.q + (-0.050234)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.304677)*sailStates.alpha + (-0.190386)*sailStates.beta + (-1.376234)*sailStates.p + (11.820590)*sailStates.q + (0.939530)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-13.669045)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.045171)*sailStates.p + (-142.523422)*sailStates.q + (-4.021934)*sailStates.r + (-0.069778)*sailStates.de;
	Cn = (-0.197773)*sailStates.alpha + (0.026757)*sailStates.beta + (-0.654187)*sailStates.p + (2.166637)*sailStates.q + (-0.012930)*sailStates.r + (-0.000016)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end