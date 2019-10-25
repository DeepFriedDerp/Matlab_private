function [aeroForces] = paramSpace_1_3_2_1_1_3_3(sailStates,airStates)

	CL = (6.178936)*sailStates.alpha + (-0.106559)*sailStates.beta + (-3.211035)*sailStates.p + (34.365150)*sailStates.q + (1.344012)*sailStates.r + (0.009461)*sailStates.de;
	CD = -2.446670;
	CY = (0.264418)*sailStates.alpha + (-0.026077)*sailStates.beta + (0.962251)*sailStates.p + (-1.002334)*sailStates.q + (0.191440)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (2.427844)*sailStates.alpha + (-0.467034)*sailStates.beta + (-1.823439)*sailStates.p + (14.265489)*sailStates.q + (1.471214)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (-16.143923)*sailStates.alpha + (0.409798)*sailStates.beta + (12.960398)*sailStates.p + (-161.102386)*sailStates.q + (-4.295928)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-0.645986)*sailStates.alpha + (-0.080302)*sailStates.beta + (-2.503057)*sailStates.p + (13.416449)*sailStates.q + (-0.133150)*sailStates.r + (0.000528)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end