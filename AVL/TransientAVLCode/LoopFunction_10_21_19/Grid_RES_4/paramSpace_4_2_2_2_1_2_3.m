function [aeroForces] = paramSpace_4_2_2_2_1_2_3(sailStates,airStates)

	CL = (3.942032)*sailStates.alpha + (0.081443)*sailStates.beta + (-2.845677)*sailStates.p + (38.684845)*sailStates.q + (1.331366)*sailStates.r + (0.010872)*sailStates.de;
	CD = 0.035970;
	CY = (-0.072367)*sailStates.alpha + (-0.026064)*sailStates.beta + (0.382426)*sailStates.p + (-1.057315)*sailStates.q + (-0.076031)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.449398)*sailStates.alpha + (-0.118614)*sailStates.beta + (-1.483189)*sailStates.p + (13.206383)*sailStates.q + (0.955099)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-13.661833)*sailStates.alpha + (-0.278968)*sailStates.beta + (9.168920)*sailStates.p + (-144.624481)*sailStates.q + (-4.431363)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.225756)*sailStates.alpha + (0.029463)*sailStates.beta + (-0.584456)*sailStates.p + (2.435429)*sailStates.q + (-0.015134)*sailStates.r + (0.000361)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end