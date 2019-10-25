function [aeroForces] = paramSpace_2_3_1_2_2_3_1(sailStates,airStates)

	CL = (4.364895)*sailStates.alpha + (-0.047128)*sailStates.beta + (-2.137822)*sailStates.p + (30.527416)*sailStates.q + (0.716316)*sailStates.r + (0.010567)*sailStates.de;
	CD = -0.385280;
	CY = (-0.078289)*sailStates.alpha + (-0.025023)*sailStates.beta + (0.395254)*sailStates.p + (-0.100924)*sailStates.q + (0.025917)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.095424)*sailStates.alpha + (-0.209847)*sailStates.beta + (-0.854666)*sailStates.p + (6.218094)*sailStates.q + (0.724283)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-14.921665)*sailStates.alpha + (0.163972)*sailStates.beta + (7.633557)*sailStates.p + (-126.149185)*sailStates.q + (-2.397023)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.519211)*sailStates.alpha + (-0.012000)*sailStates.beta + (-0.946838)*sailStates.p + (4.628599)*sailStates.q + (-0.011156)*sailStates.r + (0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end