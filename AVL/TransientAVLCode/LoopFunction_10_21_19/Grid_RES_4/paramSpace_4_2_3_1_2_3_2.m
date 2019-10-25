function [aeroForces] = paramSpace_4_2_3_1_2_3_2(sailStates,airStates)

	CL = (6.530472)*sailStates.alpha + (0.247037)*sailStates.beta + (-2.649760)*sailStates.p + (43.238506)*sailStates.q + (3.242831)*sailStates.r + (0.012162)*sailStates.de;
	CD = -2.401390;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (1.260936)*sailStates.p + (0.000000)*sailStates.q + (-0.250816)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.972870)*sailStates.alpha + (-0.559185)*sailStates.beta + (-1.232452)*sailStates.p + (12.200650)*sailStates.q + (2.780747)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-10.547221)*sailStates.alpha + (-0.937395)*sailStates.beta + (6.694096)*sailStates.p + (-134.847153)*sailStates.q + (-10.741502)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.103747)*sailStates.alpha + (0.127594)*sailStates.beta + (-2.664386)*sailStates.p + (11.175427)*sailStates.q + (0.025557)*sailStates.r + (0.000217)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end