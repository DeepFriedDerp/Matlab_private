function [aeroForces] = paramSpace_3_2_4_2_2_1_1(sailStates,airStates)

	CL = (4.364895)*sailStates.alpha + (-0.047128)*sailStates.beta + (-2.137822)*sailStates.p + (30.527416)*sailStates.q + (-0.716316)*sailStates.r + (0.010567)*sailStates.de;
	CD = -0.385280;
	CY = (0.078289)*sailStates.alpha + (-0.024930)*sailStates.beta + (-0.395254)*sailStates.p + (0.100924)*sailStates.q + (0.025917)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.152215)*sailStates.alpha + (0.177067)*sailStates.beta + (-0.887312)*sailStates.p + (6.621974)*sailStates.q + (-0.722100)*sailStates.r + (-0.000139)*sailStates.de;
	Cm = (-14.921665)*sailStates.alpha + (0.163972)*sailStates.beta + (7.633557)*sailStates.p + (-126.149185)*sailStates.q + (2.397022)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (-0.505976)*sailStates.alpha + (-0.013359)*sailStates.beta + (0.948977)*sailStates.p + (-4.655070)*sailStates.q + (-0.011299)*sailStates.r + (-0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end