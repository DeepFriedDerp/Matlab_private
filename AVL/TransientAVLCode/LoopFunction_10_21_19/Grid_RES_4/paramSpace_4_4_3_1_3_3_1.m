function [aeroForces] = paramSpace_4_4_3_1_3_3_1(sailStates,airStates)

	CL = (5.262449)*sailStates.alpha + (-0.630983)*sailStates.beta + (-1.827893)*sailStates.p + (35.430679)*sailStates.q + (2.465662)*sailStates.r + (0.011593)*sailStates.de;
	CD = -1.814790;
	CY = (-0.010597)*sailStates.alpha + (-0.032432)*sailStates.beta + (0.889377)*sailStates.p + (2.326711)*sailStates.q + (-0.176825)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (0.454656)*sailStates.alpha + (-0.680216)*sailStates.beta + (-0.491712)*sailStates.p + (4.509070)*sailStates.q + (2.132099)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-8.253858)*sailStates.alpha + (2.444202)*sailStates.beta + (4.450543)*sailStates.p + (-112.315697)*sailStates.q + (-8.196241)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (1.489469)*sailStates.alpha + (0.104799)*sailStates.beta + (-2.035892)*sailStates.p + (7.367166)*sailStates.q + (0.000134)*sailStates.r + (-0.000518)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end