function [aeroForces] = paramSpace_1_3_3_1_2_3_2(sailStates,airStates)

	CL = (5.765802)*sailStates.alpha + (-0.109254)*sailStates.beta + (-2.310498)*sailStates.p + (27.325676)*sailStates.q + (1.269815)*sailStates.r + (0.009108)*sailStates.de;
	CD = -2.011170;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.817570)*sailStates.p + (-0.000000)*sailStates.q + (0.162625)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.618319)*sailStates.alpha + (-0.436453)*sailStates.beta + (-1.093716)*sailStates.p + (7.612978)*sailStates.q + (1.426057)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-16.832581)*sailStates.alpha + (0.442232)*sailStates.beta + (9.648913)*sailStates.p + (-134.847153)*sailStates.q + (-4.113366)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.621403)*sailStates.alpha + (-0.076903)*sailStates.beta + (-2.047458)*sailStates.p + (9.813702)*sailStates.q + (-0.080399)*sailStates.r + (0.000166)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end