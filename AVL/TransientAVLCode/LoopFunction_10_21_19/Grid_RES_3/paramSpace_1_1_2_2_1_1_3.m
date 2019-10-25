function [aeroForces] = paramSpace_1_1_2_2_1_1_3(sailStates,airStates)

	CL = (4.158764)*sailStates.alpha + (-0.365932)*sailStates.beta + (-2.965690)*sailStates.p + (41.391468)*sailStates.q + (-1.837987)*sailStates.r + (0.011445)*sailStates.de;
	CD = -0.370020;
	CY = (-0.166687)*sailStates.alpha + (-0.023593)*sailStates.beta + (-0.589175)*sailStates.p + (-0.491417)*sailStates.q + (-0.103887)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.334808)*sailStates.alpha + (0.201002)*sailStates.beta + (-1.563830)*sailStates.p + (14.222528)*sailStates.q + (-1.508990)*sailStates.r + (0.001009)*sailStates.de;
	Cm = (-12.066607)*sailStates.alpha + (1.372809)*sailStates.beta + (9.168932)*sailStates.p + (-146.474228)*sailStates.q + (6.147785)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.539165)*sailStates.alpha + (0.053184)*sailStates.beta + (1.110249)*sailStates.p + (-3.660606)*sailStates.q + (-0.021687)*sailStates.r + (0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end