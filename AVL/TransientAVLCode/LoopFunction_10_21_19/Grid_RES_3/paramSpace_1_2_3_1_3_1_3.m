function [aeroForces] = paramSpace_1_2_3_1_3_1_3(sailStates,airStates)

	CL = (7.563320)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.471535)*sailStates.p + (49.730865)*sailStates.q + (-3.848031)*sailStates.r + (0.012723)*sailStates.de;
	CD = -3.072580;
	CY = (-0.246474)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.575586)*sailStates.p + (2.260756)*sailStates.q + (-0.277603)*sailStates.r + (0.000488)*sailStates.de;

	Cl = (3.197784)*sailStates.alpha + (0.697594)*sailStates.beta + (-1.900780)*sailStates.p + (18.556925)*sailStates.q + (-3.261057)*sailStates.r + (0.001388)*sailStates.de;
	Cm = (-12.785723)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.308918)*sailStates.p + (-157.393341)*sailStates.q + (12.740424)*sailStates.r + (-0.070740)*sailStates.de;
	Cn = (1.832619)*sailStates.alpha + (0.123005)*sailStates.beta + (3.224814)*sailStates.p + (-15.111822)*sailStates.q + (0.052233)*sailStates.r + (-0.000986)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end