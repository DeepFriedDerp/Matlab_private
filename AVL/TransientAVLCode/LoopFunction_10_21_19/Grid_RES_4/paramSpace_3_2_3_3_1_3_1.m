function [aeroForces] = paramSpace_3_2_3_3_1_3_1(sailStates,airStates)

	CL = (4.382530)*sailStates.alpha + (0.082184)*sailStates.beta + (-2.318327)*sailStates.p + (33.677235)*sailStates.q + (1.086170)*sailStates.r + (0.011059)*sailStates.de;
	CD = -0.246720;
	CY = (-0.105177)*sailStates.alpha + (-0.025146)*sailStates.beta + (0.461369)*sailStates.p + (-0.432842)*sailStates.q + (-0.030255)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.306767)*sailStates.alpha + (-0.189657)*sailStates.beta + (-1.013986)*sailStates.p + (8.231101)*sailStates.q + (0.930543)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.416203)*sailStates.alpha + (-0.321993)*sailStates.beta + (7.684161)*sailStates.p + (-129.813766)*sailStates.q + (-3.686077)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.346460)*sailStates.alpha + (0.014457)*sailStates.beta + (-0.961715)*sailStates.p + (4.471456)*sailStates.q + (0.006383)*sailStates.r + (0.000195)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end