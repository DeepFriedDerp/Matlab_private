function [aeroForces] = paramSpace_3_4_4_1_2_1_1(sailStates,airStates)

	CL = (5.787522)*sailStates.alpha + (0.433839)*sailStates.beta + (-1.604217)*sailStates.p + (24.900162)*sailStates.q + (-1.996403)*sailStates.r + (0.009915)*sailStates.de;
	CD = -2.169690;
	CY = (0.389156)*sailStates.alpha + (-0.025093)*sailStates.beta + (-0.988908)*sailStates.p + (0.221994)*sailStates.q + (0.064840)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.041521)*sailStates.alpha + (0.617436)*sailStates.beta + (-0.408814)*sailStates.p + (1.700496)*sailStates.q + (-1.915674)*sailStates.r + (-0.000928)*sailStates.de;
	Cm = (-14.602938)*sailStates.alpha + (-1.635128)*sailStates.beta + (6.226158)*sailStates.p + (-111.854546)*sailStates.q + (6.736728)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-2.053229)*sailStates.alpha + (-0.027647)*sailStates.beta + (2.247274)*sailStates.p + (-10.483277)*sailStates.q + (-0.020176)*sailStates.r + (-0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end