function [aeroForces] = paramSpace_1_1_1_1_1_1_2(sailStates,airStates)

	CL = (4.042035)*sailStates.alpha + (-0.153566)*sailStates.beta + (-2.554930)*sailStates.p + (37.215446)*sailStates.q + (-1.412843)*sailStates.r + (0.011018)*sailStates.de;
	CD = -0.118270;
	CY = (-0.065691)*sailStates.alpha + (-0.024263)*sailStates.beta + (-0.438021)*sailStates.p + (-0.501679)*sailStates.q + (-0.077187)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.227747)*sailStates.alpha + (0.197381)*sailStates.beta + (-1.215646)*sailStates.p + (10.657208)*sailStates.q + (-1.138132)*sailStates.r + (0.000422)*sailStates.de;
	Cm = (-12.779332)*sailStates.alpha + (0.606863)*sailStates.beta + (8.063308)*sailStates.p + (-135.934448)*sailStates.q + (4.762167)*sailStates.r + (-0.068206)*sailStates.de;
	Cn = (0.109658)*sailStates.alpha + (0.041087)*sailStates.beta + (0.812912)*sailStates.p + (-2.505438)*sailStates.q + (-0.019860)*sailStates.r + (0.000088)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end