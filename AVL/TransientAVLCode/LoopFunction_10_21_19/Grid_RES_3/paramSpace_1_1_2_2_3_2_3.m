function [aeroForces] = paramSpace_1_1_2_2_3_2_3(sailStates,airStates)

	CL = (3.910299)*sailStates.alpha + (-0.203513)*sailStates.beta + (-2.856641)*sailStates.p + (38.407738)*sailStates.q + (-1.209053)*sailStates.r + (0.010798)*sailStates.de;
	CD = 0.032870;
	CY = (0.070860)*sailStates.alpha + (-0.027419)*sailStates.beta + (-0.360894)*sailStates.p + (1.027327)*sailStates.q + (-0.063635)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.474146)*sailStates.alpha + (0.063915)*sailStates.beta + (-1.517075)*sailStates.p + (13.446411)*sailStates.q + (-0.881802)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-13.624510)*sailStates.alpha + (0.722967)*sailStates.beta + (9.301271)*sailStates.p + (-144.553253)*sailStates.q + (4.043797)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.215567)*sailStates.alpha + (0.024225)*sailStates.beta + (0.550831)*sailStates.p + (-2.304296)*sailStates.q + (-0.011191)*sailStates.r + (-0.000342)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end