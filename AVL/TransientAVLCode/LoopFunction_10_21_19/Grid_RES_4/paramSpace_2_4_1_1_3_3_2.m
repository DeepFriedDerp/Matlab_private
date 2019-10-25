function [aeroForces] = paramSpace_2_4_1_1_3_3_2(sailStates,airStates)

	CL = (5.318405)*sailStates.alpha + (-0.355950)*sailStates.beta + (-2.471751)*sailStates.p + (32.161854)*sailStates.q + (1.435921)*sailStates.r + (0.010294)*sailStates.de;
	CD = -1.651970;
	CY = (0.201017)*sailStates.alpha + (-0.022443)*sailStates.beta + (0.678894)*sailStates.p + (1.693496)*sailStates.q + (0.044318)*sailStates.r + (0.000362)*sailStates.de;

	Cl = (1.080361)*sailStates.alpha + (-0.498996)*sailStates.beta + (-1.120870)*sailStates.p + (8.436470)*sailStates.q + (1.458334)*sailStates.r + (0.000171)*sailStates.de;
	Cm = (-14.284780)*sailStates.alpha + (1.368349)*sailStates.beta + (8.984325)*sailStates.p + (-135.354233)*sailStates.q + (-4.858497)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (0.242619)*sailStates.alpha + (-0.025659)*sailStates.beta + (-1.658297)*sailStates.p + (6.621814)*sailStates.q + (-0.008203)*sailStates.r + (-0.000323)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end