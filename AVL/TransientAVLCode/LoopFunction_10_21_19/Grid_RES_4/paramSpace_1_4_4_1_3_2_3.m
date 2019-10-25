function [aeroForces] = paramSpace_1_4_4_1_3_2_3(sailStates,airStates)

	CL = (3.923871)*sailStates.alpha + (0.278888)*sailStates.beta + (-3.265796)*sailStates.p + (42.479000)*sailStates.q + (-1.733307)*sailStates.r + (0.011042)*sailStates.de;
	CD = -0.037520;
	CY = (0.096722)*sailStates.alpha + (-0.018106)*sailStates.beta + (-0.567933)*sailStates.p + (2.326708)*sailStates.q + (-0.112719)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (1.583433)*sailStates.alpha + (0.308935)*sailStates.beta + (-1.776663)*sailStates.p + (16.057974)*sailStates.q + (-1.257239)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-13.301970)*sailStates.alpha + (-0.888257)*sailStates.beta + (10.308217)*sailStates.p + (-155.326050)*sailStates.q + (5.720705)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (0.496578)*sailStates.alpha + (0.035164)*sailStates.beta + (0.921127)*sailStates.p + (-4.738188)*sailStates.q + (0.002761)*sailStates.r + (-0.000773)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end