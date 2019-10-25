function [aeroForces] = paramSpace_1_1_3_2_3_3_1(sailStates,airStates)

	CL = (4.065436)*sailStates.alpha + (0.065519)*sailStates.beta + (-2.006585)*sailStates.p + (28.559500)*sailStates.q + (0.099124)*sailStates.r + (0.009892)*sailStates.de;
	CD = -0.281490;
	CY = (0.021458)*sailStates.alpha + (-0.025948)*sailStates.beta + (0.214395)*sailStates.p + (0.491415)*sailStates.q + (0.037850)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.013249)*sailStates.alpha + (-0.117814)*sailStates.beta + (-0.854664)*sailStates.p + (6.478133)*sailStates.q + (0.324162)*sailStates.r + (-0.000110)*sailStates.de;
	Cm = (-14.856826)*sailStates.alpha + (-0.358112)*sailStates.beta + (7.361858)*sailStates.p + (-122.751343)*sailStates.q + (-0.318105)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (0.323731)*sailStates.alpha + (-0.025343)*sailStates.beta + (-0.609972)*sailStates.p + (2.652796)*sailStates.q + (-0.024159)*sailStates.r + (-0.000098)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end