function [aeroForces] = paramSpace_4_2_2_1_2_1_2(sailStates,airStates)

	CL = (5.765802)*sailStates.alpha + (-0.109254)*sailStates.beta + (-2.310498)*sailStates.p + (27.325680)*sailStates.q + (-1.269814)*sailStates.r + (0.009108)*sailStates.de;
	CD = -2.011170;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.817570)*sailStates.p + (0.000000)*sailStates.q + (0.162625)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.674088)*sailStates.alpha + (0.380748)*sailStates.beta + (-1.125259)*sailStates.p + (8.009945)*sailStates.q + (-1.419797)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-16.832581)*sailStates.alpha + (0.442232)*sailStates.beta + (9.648913)*sailStates.p + (-134.847153)*sailStates.q + (4.113365)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.595424)*sailStates.alpha + (-0.085648)*sailStates.beta + (2.053732)*sailStates.p + (-9.892664)*sailStates.q + (-0.081644)*sailStates.r + (-0.000166)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end