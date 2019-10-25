function [aeroForces] = paramSpace_1_2_1_2_2_3_3(sailStates,airStates)

	CL = (3.991752)*sailStates.alpha + (-0.006788)*sailStates.beta + (-2.789211)*sailStates.p + (35.055832)*sailStates.q + (-0.132897)*sailStates.r + (0.009980)*sailStates.de;
	CD = -0.240960;
	CY = (0.066211)*sailStates.alpha + (-0.025328)*sailStates.beta + (0.177320)*sailStates.p + (0.301045)*sailStates.q + (0.035239)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.391409)*sailStates.alpha + (-0.105268)*sailStates.beta + (-1.471881)*sailStates.p + (12.220310)*sailStates.q + (0.104638)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-14.392495)*sailStates.alpha + (0.035461)*sailStates.beta + (10.075701)*sailStates.p + (-145.703583)*sailStates.q + (0.549387)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.152516)*sailStates.alpha + (-0.022898)*sailStates.beta + (-0.691545)*sailStates.p + (4.044552)*sailStates.q + (-0.058689)*sailStates.r + (-0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end