function [aeroForces] = paramSpace_1_3_3_1_1_2_3(sailStates,airStates)

	CL = (3.402620)*sailStates.alpha + (0.061190)*sailStates.beta + (-3.381974)*sailStates.p + (42.247829)*sailStates.q + (-0.898224)*sailStates.r + (0.011146)*sailStates.de;
	CD = 0.085870;
	CY = (-0.145047)*sailStates.alpha + (-0.026007)*sailStates.beta + (-0.055040)*sailStates.p + (-1.002334)*sailStates.q + (-0.010984)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.189947)*sailStates.alpha + (0.089608)*sailStates.beta + (-1.877649)*sailStates.p + (16.357546)*sailStates.q + (-0.593003)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (-12.499147)*sailStates.alpha + (-0.212663)*sailStates.beta + (11.499424)*sailStates.p + (-161.102386)*sailStates.q + (3.048881)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (0.446325)*sailStates.alpha + (0.017182)*sailStates.beta + (-0.177106)*sailStates.p + (2.898969)*sailStates.q + (-0.078876)*sailStates.r + (0.000277)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end