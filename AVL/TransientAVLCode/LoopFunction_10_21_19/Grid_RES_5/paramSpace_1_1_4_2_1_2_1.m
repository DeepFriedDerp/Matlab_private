function [aeroForces] = paramSpace_1_1_4_2_1_2_1(sailStates,airStates)

	CL = (3.868489)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.194186)*sailStates.p + (31.186611)*sailStates.q + (-0.454408)*sailStates.r + (0.010010)*sailStates.de;
	CD = -0.038890;
	CY = (-0.079635)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.089466)*sailStates.p + (-0.596614)*sailStates.q + (0.022242)*sailStates.r + (-0.000125)*sailStates.de;

	Cl = (1.075468)*sailStates.alpha + (-0.021278)*sailStates.beta + (-0.964949)*sailStates.p + (7.697417)*sailStates.q + (-0.129768)*sailStates.r + (0.000093)*sailStates.de;
	Cm = (-14.531235)*sailStates.alpha + (0.000000)*sailStates.beta + (7.815588)*sailStates.p + (-128.528122)*sailStates.q + (1.574567)*sailStates.r + (-0.065887)*sailStates.de;
	Cn = (0.331317)*sailStates.alpha + (-0.005305)*sailStates.beta + (-0.370468)*sailStates.p + (2.661620)*sailStates.q + (-0.064962)*sailStates.r + (0.000184)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end