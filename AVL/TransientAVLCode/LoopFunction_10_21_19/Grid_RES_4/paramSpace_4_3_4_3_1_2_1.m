function [aeroForces] = paramSpace_4_3_4_3_1_2_1(sailStates,airStates)

	CL = (3.849821)*sailStates.alpha + (-0.080161)*sailStates.beta + (-2.214092)*sailStates.p + (33.298412)*sailStates.q + (1.022872)*sailStates.r + (0.010382)*sailStates.de;
	CD = 0.070500;
	CY = (-0.070288)*sailStates.alpha + (-0.024632)*sailStates.beta + (0.290113)*sailStates.p + (-0.294836)*sailStates.q + (-0.057739)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.096807)*sailStates.alpha + (-0.153996)*sailStates.beta + (-0.932075)*sailStates.p + (7.755499)*sailStates.q + (0.729340)*sailStates.r + (-0.000073)*sailStates.de;
	Cm = (-13.326246)*sailStates.alpha + (0.317321)*sailStates.beta + (7.180530)*sailStates.p + (-127.124184)*sailStates.q + (-3.452741)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.100767)*sailStates.alpha + (0.026603)*sailStates.beta + (-0.484639)*sailStates.p + (1.800229)*sailStates.q + (-0.012015)*sailStates.r + (0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end