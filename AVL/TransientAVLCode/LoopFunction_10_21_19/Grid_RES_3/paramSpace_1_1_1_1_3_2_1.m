function [aeroForces] = paramSpace_1_1_1_1_3_2_1(sailStates,airStates)

	CL = (3.750283)*sailStates.alpha + (-0.202027)*sailStates.beta + (-1.581401)*sailStates.p + (28.063757)*sailStates.q + (-1.007931)*sailStates.r + (0.010116)*sailStates.de;
	CD = -0.019400;
	CY = (0.286556)*sailStates.alpha + (-0.027824)*sailStates.beta + (-0.388586)*sailStates.p + (1.081940)*sailStates.q + (-0.068621)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (0.838948)*sailStates.alpha + (0.099688)*sailStates.beta + (-0.476349)*sailStates.p + (3.701997)*sailStates.q + (-0.740250)*sailStates.r + (-0.000764)*sailStates.de;
	Cm = (-12.519172)*sailStates.alpha + (0.790820)*sailStates.beta + (4.942121)*sailStates.p + (-108.520653)*sailStates.q + (3.378443)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-0.724754)*sailStates.alpha + (0.031316)*sailStates.beta + (0.780879)*sailStates.p + (-4.162534)*sailStates.q + (0.021926)*sailStates.r + (-0.000340)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end