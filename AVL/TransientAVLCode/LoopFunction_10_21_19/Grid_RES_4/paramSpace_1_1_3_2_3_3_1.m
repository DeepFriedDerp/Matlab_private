function [aeroForces] = paramSpace_1_1_3_2_3_3_1(sailStates,airStates)

	CL = (3.965498)*sailStates.alpha + (0.037688)*sailStates.beta + (-1.974609)*sailStates.p + (28.209244)*sailStates.q + (0.010012)*sailStates.r + (0.009628)*sailStates.de;
	CD = -0.253370;
	CY = (0.021849)*sailStates.alpha + (-0.026188)*sailStates.beta + (0.183469)*sailStates.p + (0.455226)*sailStates.q + (0.036511)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (1.008031)*sailStates.alpha + (-0.105159)*sailStates.beta + (-0.845244)*sailStates.p + (6.449769)*sailStates.q + (0.247111)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-14.596539)*sailStates.alpha + (-0.220621)*sailStates.beta + (7.272318)*sailStates.p + (-121.885399)*sailStates.q + (0.011631)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.319182)*sailStates.alpha + (-0.025800)*sailStates.beta + (-0.563430)*sailStates.p + (2.587618)*sailStates.q + (-0.029551)*sailStates.r + (-0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end