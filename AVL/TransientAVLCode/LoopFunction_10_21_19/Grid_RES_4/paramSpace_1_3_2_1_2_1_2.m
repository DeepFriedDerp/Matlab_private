function [aeroForces] = paramSpace_1_3_2_1_2_1_2(sailStates,airStates)

	CL = (6.530472)*sailStates.alpha + (0.247037)*sailStates.beta + (-2.649760)*sailStates.p + (43.238506)*sailStates.q + (-3.242831)*sailStates.r + (0.012162)*sailStates.de;
	CD = -2.401390;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-1.260936)*sailStates.p + (-0.000000)*sailStates.q + (-0.250816)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.935261)*sailStates.alpha + (0.700115)*sailStates.beta + (-1.200915)*sailStates.p + (11.803681)*sailStates.q + (-2.774460)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-10.547221)*sailStates.alpha + (-0.937394)*sailStates.beta + (6.694097)*sailStates.p + (-134.847153)*sailStates.q + (10.741500)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.168406)*sailStates.alpha + (0.122897)*sailStates.beta + (2.670659)*sailStates.p + (-11.254390)*sailStates.q + (0.026807)*sailStates.r + (-0.000217)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end