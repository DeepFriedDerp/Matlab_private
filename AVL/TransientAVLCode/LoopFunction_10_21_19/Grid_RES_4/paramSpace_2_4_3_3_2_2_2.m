function [aeroForces] = paramSpace_2_4_3_3_2_2_2(sailStates,airStates)

	CL = (4.002318)*sailStates.alpha + (0.058393)*sailStates.beta + (-2.547248)*sailStates.p + (34.694649)*sailStates.q + (-0.326645)*sailStates.r + (0.010888)*sailStates.de;
	CD = 0.028630;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.067607)*sailStates.p + (0.000000)*sailStates.q + (-0.004431)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.162373)*sailStates.alpha + (0.053988)*sailStates.beta + (-1.150055)*sailStates.p + (9.107462)*sailStates.q + (-0.211883)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.502230)*sailStates.alpha + (-0.182639)*sailStates.beta + (8.691632)*sailStates.p + (-136.150452)*sailStates.q + (1.096656)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.030831)*sailStates.alpha + (0.002505)*sailStates.beta + (0.093243)*sailStates.p + (-0.264323)*sailStates.q + (-0.002867)*sailStates.r + (-0.000013)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end