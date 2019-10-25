function [aeroForces] = paramSpace_3_3_4_2_3_2_2(sailStates,airStates)

	CL = (4.028833)*sailStates.alpha + (-0.024763)*sailStates.beta + (-2.574037)*sailStates.p + (34.951397)*sailStates.q + (0.145656)*sailStates.r + (0.010996)*sailStates.de;
	CD = 0.039550;
	CY = (0.095593)*sailStates.alpha + (-0.025332)*sailStates.beta + (-0.026317)*sailStates.p + (0.769435)*sailStates.q + (0.001806)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.225082)*sailStates.alpha + (-0.020985)*sailStates.beta + (-1.196354)*sailStates.p + (9.572361)*sailStates.q + (0.099369)*sailStates.r + (0.000318)*sailStates.de;
	Cm = (-14.637156)*sailStates.alpha + (0.121521)*sailStates.beta + (8.839972)*sailStates.p + (-137.556381)*sailStates.q + (-0.535528)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.168980)*sailStates.alpha + (0.001803)*sailStates.beta + (0.119387)*sailStates.p + (-1.464867)*sailStates.q + (-0.009593)*sailStates.r + (-0.000248)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end