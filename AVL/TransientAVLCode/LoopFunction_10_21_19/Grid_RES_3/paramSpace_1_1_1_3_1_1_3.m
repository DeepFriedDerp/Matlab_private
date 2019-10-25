function [aeroForces] = paramSpace_1_1_1_3_1_1_3(sailStates,airStates)

	CL = (3.965540)*sailStates.alpha + (-0.318765)*sailStates.beta + (-2.795339)*sailStates.p + (39.193348)*sailStates.q + (-1.509342)*sailStates.r + (0.011041)*sailStates.de;
	CD = -0.123790;
	CY = (-0.093807)*sailStates.alpha + (-0.023950)*sailStates.beta + (-0.469926)*sailStates.p + (-0.318253)*sailStates.q + (-0.082830)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.324585)*sailStates.alpha + (0.154628)*sailStates.beta + (-1.438148)*sailStates.p + (12.858457)*sailStates.q + (-1.222067)*sailStates.r + (0.000809)*sailStates.de;
	Cm = (-12.519487)*sailStates.alpha + (1.253109)*sailStates.beta + (8.836329)*sailStates.p + (-142.287766)*sailStates.q + (5.084469)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.334032)*sailStates.alpha + (0.041073)*sailStates.beta + (0.840367)*sailStates.p + (-2.561200)*sailStates.q + (-0.022877)*sailStates.r + (0.000029)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end