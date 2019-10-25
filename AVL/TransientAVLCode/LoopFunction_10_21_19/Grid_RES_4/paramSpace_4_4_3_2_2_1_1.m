function [aeroForces] = paramSpace_4_4_3_2_2_1_1(sailStates,airStates)

	CL = (4.025626)*sailStates.alpha + (0.044590)*sailStates.beta + (-1.996354)*sailStates.p + (28.132565)*sailStates.q + (-0.195914)*sailStates.r + (0.009546)*sailStates.de;
	CD = -0.315710;
	CY = (0.084666)*sailStates.alpha + (-0.025775)*sailStates.beta + (-0.289402)*sailStates.p + (0.301044)*sailStates.q + (0.057576)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (0.931701)*sailStates.alpha + (0.151618)*sailStates.beta + (-0.764441)*sailStates.p + (5.224709)*sailStates.q + (-0.401840)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-14.713264)*sailStates.alpha + (-0.178815)*sailStates.beta + (7.522444)*sailStates.p + (-122.964470)*sailStates.q + (0.569104)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.511522)*sailStates.alpha + (-0.019428)*sailStates.beta + (0.776737)*sailStates.p + (-4.060878)*sailStates.q + (-0.044353)*sailStates.r + (-0.000153)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end