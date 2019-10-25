function [aeroForces] = paramSpace_2_1_1_1_2_3_1(sailStates,airStates)

	CL = (5.787522)*sailStates.alpha + (0.433839)*sailStates.beta + (-1.604217)*sailStates.p + (24.900162)*sailStates.q + (1.996403)*sailStates.r + (0.009915)*sailStates.de;
	CD = -2.169690;
	CY = (-0.389156)*sailStates.alpha + (-0.024479)*sailStates.beta + (0.988908)*sailStates.p + (-0.221994)*sailStates.q + (0.064840)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (1.234802)*sailStates.alpha + (-0.346895)*sailStates.beta + (-0.506502)*sailStates.p + (2.909057)*sailStates.q + (1.909143)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-14.602938)*sailStates.alpha + (-1.635128)*sailStates.beta + (6.226159)*sailStates.p + (-111.854546)*sailStates.q + (-6.736728)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (1.938616)*sailStates.alpha + (-0.035558)*sailStates.beta + (-2.253677)*sailStates.p + (10.562490)*sailStates.q + (-0.020604)*sailStates.r + (0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end