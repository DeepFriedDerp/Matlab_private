function [aeroForces] = paramSpace_2_3_1_3_3_1_3(sailStates,airStates)

	CL = (4.364492)*sailStates.alpha + (0.092609)*sailStates.beta + (-2.838502)*sailStates.p + (37.910786)*sailStates.q + (-1.164018)*sailStates.r + (0.011280)*sailStates.de;
	CD = -0.247480;
	CY = (0.018328)*sailStates.alpha + (-0.024716)*sailStates.beta + (-0.497590)*sailStates.p + (0.563442)*sailStates.q + (-0.032673)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.493775)*sailStates.alpha + (0.251566)*sailStates.beta + (-1.406371)*sailStates.p + (11.773353)*sailStates.q + (-1.008570)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.332704)*sailStates.alpha + (-0.378967)*sailStates.beta + (9.418005)*sailStates.p + (-144.107040)*sailStates.q + (3.970489)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.045569)*sailStates.alpha + (0.014275)*sailStates.beta + (1.001628)*sailStates.p + (-4.544195)*sailStates.q + (0.005368)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end