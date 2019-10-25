function [aeroForces] = paramSpace_4_2_2_1_3_2_3(sailStates,airStates)

	CL = (3.402619)*sailStates.alpha + (0.061190)*sailStates.beta + (-3.381974)*sailStates.p + (42.247822)*sailStates.q + (0.898224)*sailStates.r + (0.011146)*sailStates.de;
	CD = 0.085870;
	CY = (0.145047)*sailStates.alpha + (-0.023945)*sailStates.beta + (0.055040)*sailStates.p + (1.002334)*sailStates.q + (-0.010984)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (1.224771)*sailStates.alpha + (-0.044542)*sailStates.beta + (-1.909192)*sailStates.p + (16.754509)*sailStates.q + (0.599263)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-12.499147)*sailStates.alpha + (-0.212663)*sailStates.beta + (11.499424)*sailStates.p + (-161.102386)*sailStates.q + (-3.048881)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-0.459359)*sailStates.alpha + (0.009502)*sailStates.beta + (0.183380)*sailStates.p + (-2.977930)*sailStates.q + (-0.080121)*sailStates.r + (-0.000277)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end