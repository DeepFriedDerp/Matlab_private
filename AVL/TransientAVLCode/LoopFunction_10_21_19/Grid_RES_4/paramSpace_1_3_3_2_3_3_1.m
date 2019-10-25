function [aeroForces] = paramSpace_1_3_3_2_3_3_1(sailStates,airStates)

	CL = (4.023944)*sailStates.alpha + (-0.012097)*sailStates.beta + (-1.993487)*sailStates.p + (28.477571)*sailStates.q + (0.002537)*sailStates.r + (0.009783)*sailStates.de;
	CD = -0.252370;
	CY = (0.022572)*sailStates.alpha + (-0.024508)*sailStates.beta + (0.181837)*sailStates.p + (0.455227)*sailStates.q + (0.036186)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (0.913046)*sailStates.alpha + (-0.110799)*sailStates.beta + (-0.791131)*sailStates.p + (5.732732)*sailStates.q + (0.254541)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-14.816583)*sailStates.alpha + (0.072012)*sailStates.beta + (7.334547)*sailStates.p + (-122.911674)*sailStates.q + (0.036668)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.317746)*sailStates.alpha + (-0.020432)*sailStates.beta + (-0.548640)*sailStates.p + (2.424855)*sailStates.q + (-0.027272)*sailStates.r + (-0.000085)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end