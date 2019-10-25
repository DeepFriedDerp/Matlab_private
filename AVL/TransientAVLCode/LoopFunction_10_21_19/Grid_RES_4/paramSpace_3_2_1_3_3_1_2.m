function [aeroForces] = paramSpace_3_2_1_3_3_1_2(sailStates,airStates)

	CL = (4.320788)*sailStates.alpha + (-0.044437)*sailStates.beta + (-2.555017)*sailStates.p + (34.135746)*sailStates.q + (-0.462250)*sailStates.r + (0.010930)*sailStates.de;
	CD = -0.209340;
	CY = (0.060963)*sailStates.alpha + (-0.024851)*sailStates.beta + (-0.335719)*sailStates.p + (0.498142)*sailStates.q + (0.021952)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.387870)*sailStates.alpha + (0.137432)*sailStates.beta + (-1.222282)*sailStates.p + (9.772532)*sailStates.q + (-0.523029)*sailStates.r + (0.000399)*sailStates.de;
	Cm = (-15.240309)*sailStates.alpha + (0.204433)*sailStates.beta + (8.963765)*sailStates.p + (-137.428818)*sailStates.q + (1.591773)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.239022)*sailStates.alpha + (-0.010272)*sailStates.beta + (0.790158)*sailStates.p + (-4.062417)*sailStates.q + (-0.012490)*sailStates.r + (-0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end