function [aeroForces] = paramSpace_1_3_2_2_3_2_3(sailStates,airStates)

	CL = (3.910298)*sailStates.alpha + (0.203513)*sailStates.beta + (-2.856641)*sailStates.p + (38.407738)*sailStates.q + (-1.209053)*sailStates.r + (0.010798)*sailStates.de;
	CD = 0.032870;
	CY = (0.070860)*sailStates.alpha + (-0.022243)*sailStates.beta + (-0.360894)*sailStates.p + (1.027327)*sailStates.q + (-0.063635)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.363002)*sailStates.alpha + (0.210460)*sailStates.beta + (-1.432439)*sailStates.p + (12.385543)*sailStates.q + (-0.866879)*sailStates.r + (0.000688)*sailStates.de;
	Cm = (-13.624509)*sailStates.alpha + (-0.722967)*sailStates.beta + (9.301271)*sailStates.p + (-144.553238)*sailStates.q + (4.043797)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.162580)*sailStates.alpha + (0.024154)*sailStates.beta + (0.565755)*sailStates.p + (-2.491356)*sailStates.q + (-0.008560)*sailStates.r + (-0.000342)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end