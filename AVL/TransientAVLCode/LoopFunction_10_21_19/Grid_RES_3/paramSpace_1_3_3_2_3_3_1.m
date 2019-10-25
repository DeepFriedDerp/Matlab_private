function [aeroForces] = paramSpace_1_3_3_2_3_3_1(sailStates,airStates)

	CL = (4.065436)*sailStates.alpha + (-0.065519)*sailStates.beta + (-2.006585)*sailStates.p + (28.559500)*sailStates.q + (0.099124)*sailStates.r + (0.009892)*sailStates.de;
	CD = -0.281490;
	CY = (0.021458)*sailStates.alpha + (-0.023714)*sailStates.beta + (0.214395)*sailStates.p + (0.491415)*sailStates.q + (0.037850)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (0.862665)*sailStates.alpha + (-0.136489)*sailStates.beta + (-0.770012)*sailStates.p + (5.417265)*sailStates.q + (0.338988)*sailStates.r + (-0.000336)*sailStates.de;
	Cm = (-14.856826)*sailStates.alpha + (0.358112)*sailStates.beta + (7.361858)*sailStates.p + (-122.751358)*sailStates.q + (-0.318105)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (0.327537)*sailStates.alpha + (-0.019497)*sailStates.beta + (-0.595045)*sailStates.p + (2.465736)*sailStates.q + (-0.021544)*sailStates.r + (-0.000098)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end