function [aeroForces] = paramSpace_2_2_4_2_2_1_2(sailStates,airStates)

	CL = (4.588048)*sailStates.alpha + (-0.090971)*sailStates.beta + (-2.593366)*sailStates.p + (36.151794)*sailStates.q + (-1.329445)*sailStates.r + (0.011330)*sailStates.de;
	CD = -0.454550;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.530000)*sailStates.p + (-0.000001)*sailStates.q + (-0.034738)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.428791)*sailStates.alpha + (0.235831)*sailStates.beta + (-1.232877)*sailStates.p + (10.306245)*sailStates.q + (-1.137959)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.331306)*sailStates.alpha + (0.324104)*sailStates.beta + (8.537408)*sailStates.p + (-137.194580)*sailStates.q + (4.475021)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.120918)*sailStates.alpha + (0.017710)*sailStates.beta + (1.138274)*sailStates.p + (-5.066298)*sailStates.q + (0.005079)*sailStates.r + (-0.000114)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end