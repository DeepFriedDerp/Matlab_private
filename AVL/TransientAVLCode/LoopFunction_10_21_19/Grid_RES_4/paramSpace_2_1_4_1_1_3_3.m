function [aeroForces] = paramSpace_2_1_4_1_1_3_3(sailStates,airStates)

	CL = (6.896531)*sailStates.alpha + (0.526937)*sailStates.beta + (-3.391381)*sailStates.p + (39.092880)*sailStates.q + (2.232413)*sailStates.r + (0.010844)*sailStates.de;
	CD = -2.827580;
	CY = (0.284561)*sailStates.alpha + (-0.023682)*sailStates.beta + (1.235518)*sailStates.p + (-1.471501)*sailStates.q + (0.080825)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (2.843082)*sailStates.alpha + (-0.409698)*sailStates.beta + (-1.962896)*sailStates.p + (16.290035)*sailStates.q + (2.152355)*sailStates.r + (0.001687)*sailStates.de;
	Cm = (-15.718622)*sailStates.alpha + (-2.145241)*sailStates.beta + (12.337303)*sailStates.p + (-161.242615)*sailStates.q + (-7.586865)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (-1.165460)*sailStates.alpha + (-0.041649)*sailStates.beta + (-2.829301)*sailStates.p + (14.281233)*sailStates.q + (-0.036096)*sailStates.r + (0.000667)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end