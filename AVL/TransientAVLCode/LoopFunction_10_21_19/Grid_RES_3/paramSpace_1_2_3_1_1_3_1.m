function [aeroForces] = paramSpace_1_2_3_1_1_3_1(sailStates,airStates)

	CL = (6.661761)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.535625)*sailStates.p + (20.637884)*sailStates.q + (2.109866)*sailStates.r + (0.009081)*sailStates.de;
	CD = -2.736210;
	CY = (-0.685364)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.217879)*sailStates.p + (-2.260755)*sailStates.q + (0.214530)*sailStates.r + (-0.000475)*sailStates.de;

	Cl = (1.909647)*sailStates.alpha + (-0.518740)*sailStates.beta + (-0.449430)*sailStates.p + (1.213945)*sailStates.q + (2.115171)*sailStates.r + (-0.000686)*sailStates.de;
	Cm = (-18.480389)*sailStates.alpha + (0.000001)*sailStates.beta + (7.347008)*sailStates.p + (-113.665031)*sailStates.q + (-6.942494)*sailStates.r + (-0.066352)*sailStates.de;
	Cn = (2.628479)*sailStates.alpha + (-0.091468)*sailStates.beta + (-2.735518)*sailStates.p + (13.923732)*sailStates.q + (-0.095400)*sailStates.r + (0.000829)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end