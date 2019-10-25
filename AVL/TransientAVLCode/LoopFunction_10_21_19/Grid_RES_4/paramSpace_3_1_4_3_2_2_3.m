function [aeroForces] = paramSpace_3_1_4_3_2_2_3(sailStates,airStates)

	CL = (3.934330)*sailStates.alpha + (0.106060)*sailStates.beta + (-2.806961)*sailStates.p + (36.836071)*sailStates.q + (0.378737)*sailStates.r + (0.010956)*sailStates.de;
	CD = 0.044420;
	CY = (0.003556)*sailStates.alpha + (-0.024876)*sailStates.beta + (0.107985)*sailStates.p + (-0.065300)*sailStates.q + (-0.007085)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.395700)*sailStates.alpha + (-0.023968)*sailStates.beta + (-1.460080)*sailStates.p + (12.290215)*sailStates.q + (0.294122)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.236663)*sailStates.alpha + (-0.472123)*sailStates.beta + (9.553540)*sailStates.p + (-143.297119)*sailStates.q + (-1.315322)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (-0.095501)*sailStates.alpha + (0.002803)*sailStates.beta + (-0.138626)*sailStates.p + (0.225406)*sailStates.q + (-0.004185)*sailStates.r + (0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end