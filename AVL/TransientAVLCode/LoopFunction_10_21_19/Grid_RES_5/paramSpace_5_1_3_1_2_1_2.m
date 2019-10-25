function [aeroForces] = paramSpace_5_1_3_1_2_1_2(sailStates,airStates)

	CL = (5.241144)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.096505)*sailStates.p + (41.733150)*sailStates.q + (-2.172942)*sailStates.r + (0.011756)*sailStates.de;
	CD = -1.013710;
	CY = (-0.034663)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.906425)*sailStates.p + (1.178226)*sailStates.q + (-0.095228)*sailStates.r + (0.000256)*sailStates.de;

	Cl = (2.001441)*sailStates.alpha + (0.405748)*sailStates.beta + (-1.621773)*sailStates.p + (14.365167)*sailStates.q + (-1.847677)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-13.922931)*sailStates.alpha + (0.000000)*sailStates.beta + (9.699687)*sailStates.p + (-150.099487)*sailStates.q + (7.301581)*sailStates.r + (-0.071133)*sailStates.de;
	Cn = (0.454716)*sailStates.alpha + (0.042646)*sailStates.beta + (1.859016)*sailStates.p + (-8.767601)*sailStates.q + (0.019031)*sailStates.r + (-0.000519)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end