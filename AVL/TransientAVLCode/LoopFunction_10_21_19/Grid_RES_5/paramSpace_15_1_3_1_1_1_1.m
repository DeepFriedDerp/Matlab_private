function [aeroForces] = paramSpace_15_1_3_1_1_1_1(sailStates,airStates)

	CL = (3.935155)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.795118)*sailStates.p + (25.832188)*sailStates.q + (-0.091271)*sailStates.r + (0.009024)*sailStates.de;
	CD = -0.395770;
	CY = (-0.001953)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.234733)*sailStates.p + (-0.476205)*sailStates.q + (0.058508)*sailStates.r + (-0.000099)*sailStates.de;

	Cl = (0.814022)*sailStates.alpha + (0.136080)*sailStates.beta + (-0.682079)*sailStates.p + (4.657436)*sailStates.q + (-0.361440)*sailStates.r + (-0.000383)*sailStates.de;
	Cm = (-14.602504)*sailStates.alpha + (0.000000)*sailStates.beta + (6.951793)*sailStates.p + (-118.206032)*sailStates.q + (0.181102)*sailStates.r + (-0.064943)*sailStates.de;
	Cn = (-0.455142)*sailStates.alpha + (-0.033929)*sailStates.beta + (0.691888)*sailStates.p + (-3.108932)*sailStates.q + (-0.039969)*sailStates.r + (0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end