function [aeroForces] = paramSpace_2_3_3_3_3_2_2(sailStates,airStates)

	CL = (4.093360)*sailStates.alpha + (0.025693)*sailStates.beta + (-2.561769)*sailStates.p + (34.988228)*sailStates.q + (-0.459273)*sailStates.r + (0.011055)*sailStates.de;
	CD = 0.019470;
	CY = (0.062614)*sailStates.alpha + (-0.024816)*sailStates.beta + (-0.148664)*sailStates.p + (0.498142)*sailStates.q + (-0.009726)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.254942)*sailStates.alpha + (0.064009)*sailStates.beta + (-1.188654)*sailStates.p + (9.592986)*sailStates.q + (-0.321944)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.747523)*sailStates.alpha + (-0.082075)*sailStates.beta + (8.701097)*sailStates.p + (-136.960373)*sailStates.q + (1.539482)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (-0.047135)*sailStates.alpha + (0.003448)*sailStates.beta + (0.257188)*sailStates.p + (-1.358208)*sailStates.q + (0.000804)*sailStates.r + (-0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end