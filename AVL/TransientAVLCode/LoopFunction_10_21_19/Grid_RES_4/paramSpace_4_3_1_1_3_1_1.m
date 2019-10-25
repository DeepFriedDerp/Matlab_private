function [aeroForces] = paramSpace_4_3_1_1_3_1_1(sailStates,airStates)

	CL = (6.569473)*sailStates.alpha + (0.151408)*sailStates.beta + (-1.507749)*sailStates.p + (19.739279)*sailStates.q + (-2.045386)*sailStates.r + (0.008830)*sailStates.de;
	CD = -2.707960;
	CY = (0.681876)*sailStates.alpha + (-0.027209)*sailStates.beta + (-1.201503)*sailStates.p + (2.326711)*sailStates.q + (0.238744)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (1.839674)*sailStates.alpha + (0.555610)*sailStates.beta + (-0.424974)*sailStates.p + (0.786930)*sailStates.q + (-2.078994)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-18.725019)*sailStates.alpha + (-0.603690)*sailStates.beta + (7.474209)*sailStates.p + (-113.341965)*sailStates.q + (6.666878)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-2.636805)*sailStates.alpha + (-0.094970)*sailStates.beta + (2.707230)*sailStates.p + (-13.785909)*sailStates.q + (-0.108157)*sailStates.r + (-0.000842)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end