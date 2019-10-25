function [aeroForces] = paramSpace_2_1_1_1_1_1_2(sailStates,airStates)

	CL = (5.101969)*sailStates.alpha + (-2.832811)*sailStates.beta + (-6.673543)*sailStates.p + (77.783340)*sailStates.q + (5.960762)*sailStates.r + (0.014753)*sailStates.de;
	CD = -9.703110;
	CY = (4.108867)*sailStates.alpha + (-0.026674)*sailStates.beta + (2.412267)*sailStates.p + (0.400778)*sailStates.q + (-0.317439)*sailStates.r + (0.000089)*sailStates.de;

	Cl = (-2.224366)*sailStates.alpha + (-2.051095)*sailStates.beta + (-4.380950)*sailStates.p + (41.556671)*sailStates.q + (5.402666)*sailStates.r + (0.005576)*sailStates.de;
	Cm = (15.508090)*sailStates.alpha + (11.405551)*sailStates.beta + (19.588186)*sailStates.p + (-242.898392)*sailStates.q + (-20.207476)*sailStates.r + (-0.079961)*sailStates.de;
	Cn = (-15.787992)*sailStates.alpha + (0.153925)*sailStates.beta + (-4.852681)*sailStates.p + (18.772900)*sailStates.q + (-0.000988)*sailStates.r + (0.000474)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end