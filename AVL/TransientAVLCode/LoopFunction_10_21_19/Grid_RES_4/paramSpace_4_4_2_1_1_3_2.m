function [aeroForces] = paramSpace_4_4_2_1_1_3_2(sailStates,airStates)

	CL = (7.770294)*sailStates.alpha + (-0.775598)*sailStates.beta + (-2.582511)*sailStates.p + (43.195763)*sailStates.q + (3.652796)*sailStates.r + (0.012065)*sailStates.de;
	CD = -3.049230;
	CY = (-0.257449)*sailStates.alpha + (-0.019662)*sailStates.beta + (1.509366)*sailStates.p + (-1.664522)*sailStates.q + (-0.300172)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (2.954630)*sailStates.alpha + (-0.918322)*sailStates.beta + (-1.130413)*sailStates.p + (11.417336)*sailStates.q + (3.089483)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-12.164374)*sailStates.alpha + (2.862648)*sailStates.beta + (6.071521)*sailStates.p + (-131.445847)*sailStates.q + (-12.044077)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.533208)*sailStates.alpha + (0.121367)*sailStates.beta + (-3.210888)*sailStates.p + (15.104004)*sailStates.q + (0.068784)*sailStates.r + (0.000728)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end