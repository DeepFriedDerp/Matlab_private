function [aeroForces] = paramSpace_1_1_1_1_1_1_1(sailStates,airStates)

	CL = (7.994584)*sailStates.alpha + (-1.250660)*sailStates.beta + (-2.345142)*sailStates.p + (42.162636)*sailStates.q + (-3.701434)*sailStates.r + (0.012356)*sailStates.de;
	CD = -4.847520;
	CY = (-0.144867)*sailStates.alpha + (-0.013027)*sailStates.beta + (-1.438783)*sailStates.p + (-2.801271)*sailStates.q + (-0.253430)*sailStates.r + (-0.000584)*sailStates.de;

	Cl = (0.917885)*sailStates.alpha + (0.501505)*sailStates.beta + (-0.985943)*sailStates.p + (10.059216)*sailStates.q + (-3.348222)*sailStates.r + (0.000084)*sailStates.de;
	Cm = (-5.960291)*sailStates.alpha + (4.914803)*sailStates.beta + (5.429705)*sailStates.p + (-124.651535)*sailStates.q + (12.360890)*sailStates.r + (-0.065468)*sailStates.de;
	Cn = (-0.855364)*sailStates.alpha + (0.146459)*sailStates.beta + (3.204080)*sailStates.p + (-11.762794)*sailStates.q + (0.004491)*sailStates.r + (0.000545)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end