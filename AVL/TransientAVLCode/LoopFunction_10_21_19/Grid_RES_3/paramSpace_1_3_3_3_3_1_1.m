function [aeroForces] = paramSpace_1_3_3_3_3_1_1(sailStates,airStates)

	CL = (4.320211)*sailStates.alpha + (0.278268)*sailStates.beta + (-2.265313)*sailStates.p + (34.961868)*sailStates.q + (-1.559422)*sailStates.r + (0.010994)*sailStates.de;
	CD = -0.250160;
	CY = (0.101409)*sailStates.alpha + (-0.024108)*sailStates.beta + (-0.532825)*sailStates.p + (0.318251)*sailStates.q + (-0.093921)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.206156)*sailStates.alpha + (0.338683)*sailStates.beta + (-0.923484)*sailStates.p + (7.878738)*sailStates.q + (-1.204674)*sailStates.r + (-0.000142)*sailStates.de;
	Cm = (-13.220544)*sailStates.alpha + (-0.967563)*sailStates.beta + (6.912876)*sailStates.p + (-126.937798)*sailStates.q + (5.177818)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.365822)*sailStates.alpha + (0.042276)*sailStates.beta + (1.084321)*sailStates.p + (-4.857321)*sailStates.q + (0.007244)*sailStates.r + (-0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end