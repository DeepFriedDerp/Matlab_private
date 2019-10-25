function [aeroForces] = paramSpace_1_1_4_3_3_3_2(sailStates,airStates)

	CL = (3.936788)*sailStates.alpha + (-0.037327)*sailStates.beta + (-2.397964)*sailStates.p + (32.692616)*sailStates.q + (-0.430292)*sailStates.r + (0.010143)*sailStates.de;
	CD = -0.061120;
	CY = (0.059444)*sailStates.alpha + (-0.026192)*sailStates.beta + (0.026765)*sailStates.p + (0.489618)*sailStates.q + (0.005376)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.247982)*sailStates.alpha + (-0.061633)*sailStates.beta + (-1.177185)*sailStates.p + (9.832577)*sailStates.q + (-0.136098)*sailStates.r + (0.000422)*sailStates.de;
	Cm = (-14.567835)*sailStates.alpha + (0.008626)*sailStates.beta + (8.388472)*sailStates.p + (-133.122253)*sailStates.q + (1.447325)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (0.158995)*sailStates.alpha + (-0.010797)*sailStates.beta + (-0.261044)*sailStates.p + (1.436781)*sailStates.q + (-0.032820)*sailStates.r + (-0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end