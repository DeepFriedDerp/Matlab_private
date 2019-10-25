function [aeroForces] = paramSpace_3_1_4_2_2_2_1(sailStates,airStates)

	CL = (3.910890)*sailStates.alpha + (0.093656)*sailStates.beta + (-2.144618)*sailStates.p + (31.468752)*sailStates.q + (0.290236)*sailStates.r + (0.010643)*sailStates.de;
	CD = 0.042720;
	CY = (-0.000982)*sailStates.alpha + (-0.024646)*sailStates.beta + (0.080846)*sailStates.p + (0.100923)*sailStates.q + (-0.005288)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (1.088050)*sailStates.alpha + (-0.026645)*sailStates.beta + (-0.918970)*sailStates.p + (7.268672)*sailStates.q + (0.222234)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-14.199656)*sailStates.alpha + (-0.428957)*sailStates.beta + (7.342758)*sailStates.p + (-125.105080)*sailStates.q + (-1.014353)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.001223)*sailStates.alpha + (0.002486)*sailStates.beta + (-0.118582)*sailStates.p + (0.181338)*sailStates.q + (-0.003128)*sailStates.r + (-0.000034)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end