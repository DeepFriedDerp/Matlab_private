function [aeroForces] = paramSpace_1_2_3_1_1_3_2(sailStates,airStates)

	CL = (6.864273)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.395709)*sailStates.p + (27.878963)*sailStates.q + (1.805733)*sailStates.r + (0.009457)*sailStates.de;
	CD = -2.658030;
	CY = (-0.170112)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.124133)*sailStates.p + (-1.671349)*sailStates.q + (0.198056)*sailStates.r + (-0.000356)*sailStates.de;

	Cl = (2.481390)*sailStates.alpha + (-0.495383)*sailStates.beta + (-1.154484)*sailStates.p + (7.943860)*sailStates.q + (1.865894)*sailStates.r + (0.000436)*sailStates.de;
	Cm = (-18.529995)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.148262)*sailStates.p + (-137.643188)*sailStates.q + (-5.935013)*sailStates.r + (-0.068587)*sailStates.de;
	Cn = (0.865977)*sailStates.alpha + (-0.087349)*sailStates.beta + (-2.664841)*sailStates.p + (13.768438)*sailStates.q + (-0.105065)*sailStates.r + (0.000682)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end