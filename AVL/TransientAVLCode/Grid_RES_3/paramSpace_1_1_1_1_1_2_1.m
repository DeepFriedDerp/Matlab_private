function [aeroForces] = paramSpace_1_1_1_1_1_2_1(sailStates,airStates)

	CL = (14.718993)*sailStates.alpha + (-1.548604)*sailStates.beta + (-2.179956)*sailStates.p + (43.081135)*sailStates.q + (-5.312827)*sailStates.r + (0.012326)*sailStates.de;
	CD = -8.546890;
	CY = (1.041857)*sailStates.alpha + (-0.038962)*sailStates.beta + (-2.438513)*sailStates.p + (3.465600)*sailStates.q + (-0.430305)*sailStates.r + (0.000719)*sailStates.de;

	Cl = (6.571695)*sailStates.alpha + (0.607799)*sailStates.beta + (-0.883082)*sailStates.p + (10.349879)*sailStates.q + (-4.669676)*sailStates.r + (-0.000281)*sailStates.de;
	Cm = (-14.245217)*sailStates.alpha + (5.903799)*sailStates.beta + (3.520246)*sailStates.p + (-116.724937)*sailStates.q + (17.605156)*sailStates.r + (-0.064758)*sailStates.de;
	Cn = (-2.509462)*sailStates.alpha + (0.225947)*sailStates.beta + (5.299946)*sailStates.p + (-25.977098)*sailStates.q + (0.138737)*sailStates.r + (-0.001330)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end