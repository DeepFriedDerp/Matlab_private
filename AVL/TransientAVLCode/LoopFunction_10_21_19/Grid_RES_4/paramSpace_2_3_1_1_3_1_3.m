function [aeroForces] = paramSpace_2_3_1_1_3_1_3(sailStates,airStates)

	CL = (7.374582)*sailStates.alpha + (0.233363)*sailStates.beta + (-3.491801)*sailStates.p + (44.914768)*sailStates.q + (-3.129269)*sailStates.r + (0.011993)*sailStates.de;
	CD = -3.032650;
	CY = (-0.277496)*sailStates.alpha + (-0.024090)*sailStates.beta + (-1.458071)*sailStates.p + (1.915491)*sailStates.q + (-0.095769)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (3.043891)*sailStates.alpha + (0.720780)*sailStates.beta + (-1.921931)*sailStates.p + (17.023859)*sailStates.q + (-2.799894)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-14.349885)*sailStates.alpha + (-0.921699)*sailStates.beta + (11.016157)*sailStates.p + (-160.694275)*sailStates.q + (10.616362)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (1.489521)*sailStates.alpha + (0.040551)*sailStates.beta + (3.082689)*sailStates.p + (-14.836031)*sailStates.q + (0.026708)*sailStates.r + (-0.000831)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end