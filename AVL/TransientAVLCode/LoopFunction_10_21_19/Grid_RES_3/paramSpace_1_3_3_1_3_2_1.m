function [aeroForces] = paramSpace_1_3_3_1_3_2_1(sailStates,airStates)

	CL = (3.836946)*sailStates.alpha + (0.153720)*sailStates.beta + (-1.582468)*sailStates.p + (27.950502)*sailStates.q + (-0.989114)*sailStates.r + (0.010318)*sailStates.de;
	CD = -0.044970;
	CY = (0.272218)*sailStates.alpha + (-0.022373)*sailStates.beta + (-0.350630)*sailStates.p + (1.081941)*sailStates.q + (-0.061723)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (0.658086)*sailStates.alpha + (0.180160)*sailStates.beta + (-0.392344)*sailStates.p + (2.635754)*sailStates.q + (-0.664906)*sailStates.r + (-0.000988)*sailStates.de;
	Cm = (-12.973200)*sailStates.alpha + (-0.481539)*sailStates.beta + (4.960799)*sailStates.p + (-108.520645)*sailStates.q + (3.272511)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-0.748054)*sailStates.alpha + (0.018968)*sailStates.beta + (0.738902)*sailStates.p + (-4.319109)*sailStates.q + (0.024873)*sailStates.r + (-0.000350)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end