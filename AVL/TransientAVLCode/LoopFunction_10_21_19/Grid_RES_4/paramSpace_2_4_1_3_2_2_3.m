function [aeroForces] = paramSpace_2_4_1_3_2_2_3(sailStates,airStates)

	CL = (3.934330)*sailStates.alpha + (0.106060)*sailStates.beta + (-2.806961)*sailStates.p + (36.836071)*sailStates.q + (-0.378737)*sailStates.r + (0.010956)*sailStates.de;
	CD = 0.044420;
	CY = (-0.003556)*sailStates.alpha + (-0.024696)*sailStates.beta + (-0.107985)*sailStates.p + (0.065300)*sailStates.q + (-0.007085)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.257850)*sailStates.alpha + (0.076187)*sailStates.beta + (-1.362392)*sailStates.p + (11.081652)*sailStates.q + (-0.287591)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.236663)*sailStates.alpha + (-0.472123)*sailStates.beta + (9.553539)*sailStates.p + (-143.297119)*sailStates.q + (1.315323)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.073003)*sailStates.alpha + (0.003761)*sailStates.beta + (0.145029)*sailStates.p + (-0.304620)*sailStates.q + (-0.003757)*sailStates.r + (-0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end