function [aeroForces] = paramSpace_1_1_1_2_3_1_2(sailStates,airStates)

	CL = (4.728710)*sailStates.alpha + (-0.499495)*sailStates.beta + (-2.515104)*sailStates.p + (38.812786)*sailStates.q + (-2.207871)*sailStates.r + (0.011048)*sailStates.de;
	CD = -0.632670;
	CY = (0.105284)*sailStates.alpha + (-0.027428)*sailStates.beta + (-0.830359)*sailStates.p + (0.756269)*sailStates.q + (-0.165250)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.705721)*sailStates.alpha + (0.236253)*sailStates.beta + (-1.211432)*sailStates.p + (11.419163)*sailStates.q + (-1.823938)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-12.150698)*sailStates.alpha + (1.928561)*sailStates.beta + (7.167235)*sailStates.p + (-132.741776)*sailStates.q + (7.348285)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (-0.090921)*sailStates.alpha + (0.080722)*sailStates.beta + (1.649122)*sailStates.p + (-7.076389)*sailStates.q + (0.012966)*sailStates.r + (-0.000330)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end