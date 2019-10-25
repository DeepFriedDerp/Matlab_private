function [aeroForces] = paramSpace_1_3_3_2_1_3_2(sailStates,airStates)

	CL = (4.392770)*sailStates.alpha + (-0.097046)*sailStates.beta + (-2.437671)*sailStates.p + (31.628706)*sailStates.q + (0.351634)*sailStates.r + (0.010079)*sailStates.de;
	CD = -0.463760;
	CY = (-0.087052)*sailStates.alpha + (-0.026556)*sailStates.beta + (0.414154)*sailStates.p + (-0.759372)*sailStates.q + (0.072954)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.329937)*sailStates.alpha + (-0.197739)*sailStates.beta + (-1.115474)*sailStates.p + (8.406384)*sailStates.q + (0.546000)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-15.562021)*sailStates.alpha + (0.462830)*sailStates.beta + (9.098434)*sailStates.p + (-135.573257)*sailStates.q + (-1.132825)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.431963)*sailStates.alpha + (-0.023113)*sailStates.beta + (-1.070984)*sailStates.p + (5.839854)*sailStates.q + (-0.058050)*sailStates.r + (0.000288)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end