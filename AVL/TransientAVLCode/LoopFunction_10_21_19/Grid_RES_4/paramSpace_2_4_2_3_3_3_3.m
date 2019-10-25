function [aeroForces] = paramSpace_2_4_2_3_3_3_3(sailStates,airStates)

	CL = (4.057660)*sailStates.alpha + (-0.049535)*sailStates.beta + (-2.785188)*sailStates.p + (36.066185)*sailStates.q + (0.152723)*sailStates.r + (0.010828)*sailStates.de;
	CD = -0.099790;
	CY = (0.083660)*sailStates.alpha + (-0.024125)*sailStates.beta + (0.134738)*sailStates.p + (0.563442)*sailStates.q + (0.008811)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.252569)*sailStates.alpha + (-0.099062)*sailStates.beta + (-1.354011)*sailStates.p + (10.883436)*sailStates.q + (0.240582)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.504154)*sailStates.alpha + (0.200200)*sailStates.beta + (9.644782)*sailStates.p + (-143.062881)*sailStates.q + (-0.514875)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.011197)*sailStates.alpha + (-0.005248)*sailStates.beta + (-0.403986)*sailStates.p + (1.733786)*sailStates.q + (-0.004884)*sailStates.r + (-0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end