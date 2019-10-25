function [aeroForces] = paramSpace_1_3_1_3_2_1_3(sailStates,airStates)

	CL = (4.093577)*sailStates.alpha + (0.334391)*sailStates.beta + (-2.782381)*sailStates.p + (39.265400)*sailStates.q + (-1.635753)*sailStates.r + (0.011038)*sailStates.de;
	CD = -0.180800;
	CY = (-0.037873)*sailStates.alpha + (-0.024351)*sailStates.beta + (-0.548354)*sailStates.p + (0.173375)*sailStates.q + (-0.096706)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.324991)*sailStates.alpha + (0.361207)*sailStates.beta + (-1.345461)*sailStates.p + (11.820391)*sailStates.q + (-1.310712)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-12.650834)*sailStates.alpha + (-1.304978)*sailStates.beta + (8.686531)*sailStates.p + (-141.665955)*sailStates.q + (5.495874)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.200227)*sailStates.alpha + (0.046697)*sailStates.beta + (1.019705)*sailStates.p + (-3.863350)*sailStates.q + (-0.009697)*sailStates.r + (-0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end