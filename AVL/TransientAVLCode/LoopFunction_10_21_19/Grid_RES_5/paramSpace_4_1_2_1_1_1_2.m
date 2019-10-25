function [aeroForces] = paramSpace_4_1_2_1_1_1_2(sailStates,airStates)

	CL = (4.403754)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.123145)*sailStates.p + (42.468987)*sailStates.q + (-1.892649)*sailStates.r + (0.011766)*sailStates.de;
	CD = -0.616930;
	CY = (-0.234406)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.656404)*sailStates.p + (-0.696928)*sailStates.q + (-0.092227)*sailStates.r + (-0.000151)*sailStates.de;

	Cl = (1.317029)*sailStates.alpha + (0.356155)*sailStates.beta + (-1.634933)*sailStates.p + (14.552316)*sailStates.q + (-1.609707)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-12.182273)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.782149)*sailStates.p + (-151.165665)*sailStates.q + (6.375407)*sailStates.r + (-0.070716)*sailStates.de;
	Cn = (0.638456)*sailStates.alpha + (0.050054)*sailStates.beta + (1.296080)*sailStates.p + (-4.509794)*sailStates.q + (-0.011869)*sailStates.r + (0.000079)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end