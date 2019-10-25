function [aeroForces] = paramSpace_4_4_3_2_1_3_2(sailStates,airStates)

	CL = (4.760707)*sailStates.alpha + (-0.478976)*sailStates.beta + (-2.515800)*sailStates.p + (38.764565)*sailStates.q + (2.199497)*sailStates.r + (0.011134)*sailStates.de;
	CD = -0.638080;
	CY = (-0.105280)*sailStates.alpha + (-0.022301)*sailStates.beta + (0.816026)*sailStates.p + (-0.756269)*sailStates.q + (-0.162345)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.576783)*sailStates.alpha + (-0.515656)*sailStates.beta + (-1.117404)*sailStates.p + (10.229074)*sailStates.q + (1.781836)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-12.345432)*sailStates.alpha + (1.797027)*sailStates.beta + (7.176808)*sailStates.p + (-132.741791)*sailStates.q + (-7.300155)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.221097)*sailStates.alpha + (0.069185)*sailStates.beta + (-1.646239)*sailStates.p + (7.301562)*sailStates.q + (0.017238)*sailStates.r + (0.000339)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end