function [aeroForces] = paramSpace_4_4_4_1_2_3_1(sailStates,airStates)

	CL = (6.170535)*sailStates.alpha + (-0.710759)*sailStates.beta + (-1.778295)*sailStates.p + (35.752308)*sailStates.q + (2.898965)*sailStates.r + (0.011503)*sailStates.de;
	CD = -2.361160;
	CY = (-0.347088)*sailStates.alpha + (-0.027100)*sailStates.beta + (1.167992)*sailStates.p + (0.662189)*sailStates.q + (-0.232257)*sailStates.r + (0.000137)*sailStates.de;

	Cl = (1.234183)*sailStates.alpha + (-0.779989)*sailStates.beta + (-0.460898)*sailStates.p + (4.598050)*sailStates.q + (2.504300)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-8.744846)*sailStates.alpha + (2.768656)*sailStates.beta + (3.872673)*sailStates.p + (-109.940704)*sailStates.q + (-9.611950)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (2.119098)*sailStates.alpha + (0.111481)*sailStates.beta + (-2.615219)*sailStates.p + (11.165764)*sailStates.q + (0.039835)*sailStates.r + (-0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end