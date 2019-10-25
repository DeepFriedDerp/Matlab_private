function [aeroForces] = paramSpace_3_3_1_3_3_1_2(sailStates,airStates)

	CL = (4.320788)*sailStates.alpha + (0.044437)*sailStates.beta + (-2.555017)*sailStates.p + (34.135746)*sailStates.q + (-0.462249)*sailStates.r + (0.010930)*sailStates.de;
	CD = -0.209340;
	CY = (0.060963)*sailStates.alpha + (-0.025101)*sailStates.beta + (-0.335719)*sailStates.p + (0.498142)*sailStates.q + (0.021952)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.336755)*sailStates.alpha + (0.157835)*sailStates.beta + (-1.189631)*sailStates.p + (9.368656)*sailStates.q + (-0.525126)*sailStates.r + (0.000312)*sailStates.de;
	Cm = (-15.240309)*sailStates.alpha + (-0.204433)*sailStates.beta + (8.963765)*sailStates.p + (-137.428818)*sailStates.q + (1.591773)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.248615)*sailStates.alpha + (-0.009080)*sailStates.beta + (0.788018)*sailStates.p + (-4.035945)*sailStates.q + (-0.012353)*sailStates.r + (-0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end