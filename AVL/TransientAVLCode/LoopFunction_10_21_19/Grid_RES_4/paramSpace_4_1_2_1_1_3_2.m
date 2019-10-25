function [aeroForces] = paramSpace_4_1_2_1_1_3_2(sailStates,airStates)

	CL = (7.770294)*sailStates.alpha + (0.775598)*sailStates.beta + (-2.582511)*sailStates.p + (43.195763)*sailStates.q + (3.652796)*sailStates.r + (0.012065)*sailStates.de;
	CD = -3.049230;
	CY = (-0.257449)*sailStates.alpha + (-0.029911)*sailStates.beta + (1.509366)*sailStates.p + (-1.664522)*sailStates.q + (-0.300172)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (3.066850)*sailStates.alpha + (-0.443343)*sailStates.beta + (-1.224803)*sailStates.p + (12.605217)*sailStates.q + (3.108215)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-12.164373)*sailStates.alpha + (-2.862649)*sailStates.beta + (6.071521)*sailStates.p + (-131.445847)*sailStates.q + (-12.044076)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.324026)*sailStates.alpha + (0.149485)*sailStates.beta + (-3.192113)*sailStates.p + (14.867720)*sailStates.q + (0.065058)*sailStates.r + (0.000728)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end