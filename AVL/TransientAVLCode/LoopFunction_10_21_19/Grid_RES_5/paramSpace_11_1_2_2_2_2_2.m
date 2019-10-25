function [aeroForces] = paramSpace_11_1_2_2_2_2_2(sailStates,airStates)

	CL = (4.123184)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.793561)*sailStates.p + (37.780376)*sailStates.q + (1.005128)*sailStates.r + (0.011320)*sailStates.de;
	CD = -0.086620;
	CY = (0.069308)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.314040)*sailStates.p + (0.322047)*sailStates.q + (-0.033018)*sailStates.r + (0.000070)*sailStates.de;

	Cl = (1.319796)*sailStates.alpha + (-0.169994)*sailStates.beta + (-1.385268)*sailStates.p + (11.702713)*sailStates.q + (0.805929)*sailStates.r + (0.000639)*sailStates.de;
	Cm = (-14.030043)*sailStates.alpha + (0.000000)*sailStates.beta + (9.241618)*sailStates.p + (-143.031982)*sailStates.q + (-3.387531)*sailStates.r + (-0.070367)*sailStates.de;
	Cn = (-0.159539)*sailStates.alpha + (0.017867)*sailStates.beta + (-0.595996)*sailStates.p + (2.048660)*sailStates.q + (-0.006771)*sailStates.r + (-0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end