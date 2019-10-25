function [aeroForces] = paramSpace_4_3_4_2_2_1_3(sailStates,airStates)

	CL = (3.991751)*sailStates.alpha + (-0.006788)*sailStates.beta + (-2.789211)*sailStates.p + (35.055836)*sailStates.q + (0.132898)*sailStates.r + (0.009980)*sailStates.de;
	CD = -0.240960;
	CY = (-0.066211)*sailStates.alpha + (-0.024625)*sailStates.beta + (-0.177320)*sailStates.p + (-0.301045)*sailStates.q + (0.035239)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.346482)*sailStates.alpha + (0.096237)*sailStates.beta + (-1.440349)*sailStates.p + (11.823343)*sailStates.q + (-0.110953)*sailStates.r + (0.000805)*sailStates.de;
	Cm = (-14.392496)*sailStates.alpha + (0.035461)*sailStates.beta + (10.075702)*sailStates.p + (-145.703583)*sailStates.q + (-0.549387)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.152704)*sailStates.alpha + (-0.017184)*sailStates.beta + (0.685272)*sailStates.p + (-3.965591)*sailStates.q + (-0.057433)*sailStates.r + (0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end