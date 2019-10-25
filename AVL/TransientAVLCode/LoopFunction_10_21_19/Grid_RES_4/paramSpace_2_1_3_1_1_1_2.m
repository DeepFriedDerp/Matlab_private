function [aeroForces] = paramSpace_2_1_3_1_1_1_2(sailStates,airStates)

	CL = (5.530098)*sailStates.alpha + (-0.515027)*sailStates.beta + (-2.622275)*sailStates.p + (37.260323)*sailStates.q + (-2.106296)*sailStates.r + (0.011424)*sailStates.de;
	CD = -1.801060;
	CY = (-0.219606)*sailStates.alpha + (-0.023158)*sailStates.beta + (-0.843794)*sailStates.p + (-1.693496)*sailStates.q + (-0.055365)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (1.224681)*sailStates.alpha + (0.348395)*sailStates.beta + (-1.276704)*sailStates.p + (10.988526)*sailStates.q + (-1.935909)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-12.387431)*sailStates.alpha + (2.005994)*sailStates.beta + (8.392386)*sailStates.p + (-136.946671)*sailStates.q + (7.151668)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.030364)*sailStates.alpha + (0.032666)*sailStates.beta + (1.882237)*sailStates.p + (-7.094248)*sailStates.q + (0.002055)*sailStates.r + (0.000314)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end