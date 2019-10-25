function [aeroForces] = paramSpace_1_3_1_1_3_2_1(sailStates,airStates)

	CL = (3.750283)*sailStates.alpha + (0.202027)*sailStates.beta + (-1.581401)*sailStates.p + (28.063761)*sailStates.q + (-1.007931)*sailStates.r + (0.010116)*sailStates.de;
	CD = -0.019400;
	CY = (0.286556)*sailStates.alpha + (-0.021838)*sailStates.beta + (-0.388586)*sailStates.p + (1.081940)*sailStates.q + (-0.068621)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (0.682143)*sailStates.alpha + (0.197619)*sailStates.beta + (-0.391731)*sailStates.p + (2.641129)*sailStates.q + (-0.725229)*sailStates.r + (-0.000988)*sailStates.de;
	Cm = (-12.519171)*sailStates.alpha + (-0.790820)*sailStates.beta + (4.942121)*sailStates.p + (-108.520645)*sailStates.q + (3.378443)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-0.788588)*sailStates.alpha + (0.021107)*sailStates.beta + (0.795800)*sailStates.p + (-4.349594)*sailStates.q + (0.024575)*sailStates.r + (-0.000340)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end