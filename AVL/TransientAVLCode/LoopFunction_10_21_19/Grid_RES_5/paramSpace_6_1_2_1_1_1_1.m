function [aeroForces] = paramSpace_6_1_2_1_1_1_1(sailStates,airStates)

	CL = (4.511246)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.103633)*sailStates.p + (32.459236)*sailStates.q + (-1.315414)*sailStates.r + (0.011132)*sailStates.de;
	CD = -0.597750;
	CY = (-0.034133)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.513583)*sailStates.p + (-1.113126)*sailStates.q + (-0.035874)*sailStates.r + (-0.000238)*sailStates.de;

	Cl = (0.922860)*sailStates.alpha + (0.301767)*sailStates.beta + (-0.809509)*sailStates.p + (6.343408)*sailStates.q + (-1.188346)*sailStates.r + (-0.000299)*sailStates.de;
	Cm = (-13.365660)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.867525)*sailStates.p + (-123.764404)*sailStates.q + (4.481846)*sailStates.r + (-0.068848)*sailStates.de;
	Cn = (-0.498948)*sailStates.alpha + (0.021102)*sailStates.beta + (1.138858)*sailStates.p + (-4.199898)*sailStates.q + (0.000393)*sailStates.r + (0.000237)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end