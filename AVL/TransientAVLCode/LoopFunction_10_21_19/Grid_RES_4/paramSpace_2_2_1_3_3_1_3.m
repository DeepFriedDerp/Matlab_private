function [aeroForces] = paramSpace_2_2_1_3_3_1_3(sailStates,airStates)

	CL = (4.364492)*sailStates.alpha + (-0.092608)*sailStates.beta + (-2.838502)*sailStates.p + (37.910782)*sailStates.q + (-1.164019)*sailStates.r + (0.011280)*sailStates.de;
	CD = -0.247480;
	CY = (0.018328)*sailStates.alpha + (-0.025237)*sailStates.beta + (-0.497590)*sailStates.p + (0.563442)*sailStates.q + (-0.032673)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.539343)*sailStates.alpha + (0.199865)*sailStates.beta + (-1.439017)*sailStates.p + (12.177230)*sailStates.q + (-1.010752)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.332705)*sailStates.alpha + (0.378967)*sailStates.beta + (9.418003)*sailStates.p + (-144.107025)*sailStates.q + (3.970488)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.068358)*sailStates.alpha + (0.015313)*sailStates.beta + (0.999488)*sailStates.p + (-4.517724)*sailStates.q + (0.005225)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end