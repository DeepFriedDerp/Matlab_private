function [aeroForces] = paramSpace_3_4_1_1_3_1_3(sailStates,airStates)

	CL = (6.896531)*sailStates.alpha + (0.526937)*sailStates.beta + (-3.391381)*sailStates.p + (39.092888)*sailStates.q + (-2.232412)*sailStates.r + (0.010844)*sailStates.de;
	CD = -2.827580;
	CY = (-0.284561)*sailStates.alpha + (-0.025890)*sailStates.beta + (-1.235518)*sailStates.p + (1.471501)*sailStates.q + (0.080825)*sailStates.r + (0.000320)*sailStates.de;

	Cl = (2.720794)*sailStates.alpha + (0.698213)*sailStates.beta + (-1.865193)*sailStates.p + (15.081470)*sailStates.q + (-2.158631)*sailStates.r + (0.001423)*sailStates.de;
	Cm = (-15.718622)*sailStates.alpha + (-2.145241)*sailStates.beta + (12.337303)*sailStates.p + (-161.242615)*sailStates.q + (7.586863)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (1.027109)*sailStates.alpha + (-0.030967)*sailStates.beta + (2.822897)*sailStates.p + (-14.202019)*sailStates.q + (-0.035685)*sailStates.r + (-0.000667)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end