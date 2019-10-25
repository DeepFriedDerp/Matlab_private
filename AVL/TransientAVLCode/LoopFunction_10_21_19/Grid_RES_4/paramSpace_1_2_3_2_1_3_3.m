function [aeroForces] = paramSpace_1_2_3_2_1_3_3(sailStates,airStates)

	CL = (4.229242)*sailStates.alpha + (0.015835)*sailStates.beta + (-2.813111)*sailStates.p + (34.833355)*sailStates.q + (0.078606)*sailStates.r + (0.010164)*sailStates.de;
	CD = -0.401400;
	CY = (0.003898)*sailStates.alpha + (-0.024508)*sailStates.beta + (0.326635)*sailStates.p + (-0.455225)*sailStates.q + (0.064955)*sailStates.r + (-0.000097)*sailStates.de;

	Cl = (1.503062)*sailStates.alpha + (-0.144828)*sailStates.beta + (-1.486549)*sailStates.p + (12.176492)*sailStates.q + (0.311249)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-15.043636)*sailStates.alpha + (-0.083573)*sailStates.beta + (10.355689)*sailStates.p + (-146.782669)*sailStates.q + (-0.181475)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (0.191615)*sailStates.alpha + (-0.032726)*sailStates.beta + (-0.989046)*sailStates.p + (5.787485)*sailStates.q + (-0.076032)*sailStates.r + (0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end