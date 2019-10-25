function [aeroForces] = paramSpace_4_4_4_2_1_2_2(sailStates,airStates)

	CL = (3.862161)*sailStates.alpha + (-0.261609)*sailStates.beta + (-2.437937)*sailStates.p + (35.210457)*sailStates.q + (1.184948)*sailStates.r + (0.010340)*sailStates.de;
	CD = 0.058980;
	CY = (-0.097537)*sailStates.alpha + (-0.022144)*sailStates.beta + (0.361672)*sailStates.p + (-0.756270)*sailStates.q + (-0.072022)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.213285)*sailStates.alpha + (-0.224274)*sailStates.beta + (-1.092652)*sailStates.p + (9.280196)*sailStates.q + (0.856560)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-13.242172)*sailStates.alpha + (1.021242)*sailStates.beta + (7.835984)*sailStates.p + (-132.741791)*sailStates.q + (-3.986255)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.046609)*sailStates.alpha + (0.028840)*sailStates.beta + (-0.601478)*sailStates.p + (2.531233)*sailStates.q + (-0.007654)*sailStates.r + (0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end