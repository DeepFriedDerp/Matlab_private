function [aeroForces] = paramSpace_1_1_2_1_2_1_2(sailStates,airStates)

	CL = (6.468872)*sailStates.alpha + (-0.737585)*sailStates.beta + (-2.630886)*sailStates.p + (42.969810)*sailStates.q + (-3.235291)*sailStates.r + (0.011990)*sailStates.de;
	CD = -2.400500;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-1.259194)*sailStates.p + (-0.000003)*sailStates.q + (-0.250469)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.990399)*sailStates.alpha + (0.411887)*sailStates.beta + (-1.255020)*sailStates.p + (12.520697)*sailStates.q + (-2.781765)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-10.364320)*sailStates.alpha + (2.798906)*sailStates.beta + (6.631945)*sailStates.p + (-133.820877)*sailStates.q + (10.716094)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.038508)*sailStates.alpha + (0.130826)*sailStates.beta + (2.655707)*sailStates.p + (-11.091537)*sailStates.q + (0.024521)*sailStates.r + (-0.000215)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end