function [aeroForces] = paramSpace_1_1_2_2_1_1_2(sailStates,airStates)

	CL = (4.075257)*sailStates.alpha + (-0.157073)*sailStates.beta + (-2.774154)*sailStates.p + (37.934608)*sailStates.q + (-1.142616)*sailStates.r + (0.011248)*sailStates.de;
	CD = -0.083050;
	CY = (-0.068969)*sailStates.alpha + (-0.024521)*sailStates.beta + (-0.338671)*sailStates.p + (-0.299436)*sailStates.q + (-0.044608)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.344799)*sailStates.alpha + (0.129820)*sailStates.beta + (-1.406623)*sailStates.p + (12.153024)*sailStates.q + (-0.896771)*sailStates.r + (0.000722)*sailStates.de;
	Cm = (-13.727397)*sailStates.alpha + (0.553181)*sailStates.beta + (9.069356)*sailStates.p + (-142.147675)*sailStates.q + (3.829977)*sailStates.r + (-0.069412)*sailStates.de;
	Cn = (0.206867)*sailStates.alpha + (0.023074)*sailStates.beta + (0.623621)*sailStates.p + (-2.077441)*sailStates.q + (-0.011664)*sailStates.r + (0.000014)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end