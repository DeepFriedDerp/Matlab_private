function [aeroForces] = paramSpace_2_4_4_3_1_1_2(sailStates,airStates)

	CL = (4.146131)*sailStates.alpha + (0.170805)*sailStates.beta + (-2.569536)*sailStates.p + (35.431557)*sailStates.q + (-0.840263)*sailStates.r + (0.011076)*sailStates.de;
	CD = -0.126380;
	CY = (-0.062663)*sailStates.alpha + (-0.025160)*sailStates.beta + (-0.280536)*sailStates.p + (-0.498142)*sailStates.q + (-0.018440)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.159568)*sailStates.alpha + (0.213041)*sailStates.beta + (-1.158681)*sailStates.p + (9.304175)*sailStates.q + (-0.692335)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-14.181365)*sailStates.alpha + (-0.581677)*sailStates.beta + (8.607151)*sailStates.p + (-136.384674)*sailStates.q + (2.823678)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (-0.017459)*sailStates.alpha + (0.010305)*sailStates.beta + (0.598242)*sailStates.p + (-2.279809)*sailStates.q + (-0.001363)*sailStates.r + (0.000073)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end