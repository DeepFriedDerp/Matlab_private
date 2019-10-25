function [aeroForces] = paramSpace_3_4_4_2_2_2_1(sailStates,airStates)

	CL = (3.910889)*sailStates.alpha + (-0.093656)*sailStates.beta + (-2.144618)*sailStates.p + (31.468752)*sailStates.q + (0.290236)*sailStates.r + (0.010643)*sailStates.de;
	CD = 0.042720;
	CY = (-0.000982)*sailStates.alpha + (-0.024926)*sailStates.beta + (0.080846)*sailStates.p + (0.100923)*sailStates.q + (-0.005288)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (0.923326)*sailStates.alpha + (-0.059925)*sailStates.beta + (-0.821282)*sailStates.p + (6.060109)*sailStates.q + (0.215704)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-14.199656)*sailStates.alpha + (0.428957)*sailStates.beta + (7.342758)*sailStates.p + (-125.105080)*sailStates.q + (-1.014353)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.023686)*sailStates.alpha + (0.003188)*sailStates.beta + (-0.124985)*sailStates.p + (0.260551)*sailStates.q + (-0.002700)*sailStates.r + (-0.000034)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end