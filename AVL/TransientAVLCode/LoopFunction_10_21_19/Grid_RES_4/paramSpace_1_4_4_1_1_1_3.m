function [aeroForces] = paramSpace_1_4_4_1_1_1_3(sailStates,airStates)

	CL = (5.027260)*sailStates.alpha + (0.681956)*sailStates.beta + (-3.534153)*sailStates.p + (49.862545)*sailStates.q + (-3.132446)*sailStates.r + (0.012654)*sailStates.de;
	CD = -1.840190;
	CY = (-0.552963)*sailStates.alpha + (-0.027664)*sailStates.beta + (-1.070810)*sailStates.p + (-1.002333)*sailStates.q + (-0.213105)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (1.096679)*sailStates.alpha + (0.780493)*sailStates.beta + (-1.891579)*sailStates.p + (17.978775)*sailStates.q + (-2.646101)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-8.666187)*sailStates.alpha + (-2.494893)*sailStates.beta + (9.976151)*sailStates.p + (-160.076111)*sailStates.q + (10.369028)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (1.714628)*sailStates.alpha + (0.114181)*sailStates.beta + (2.153022)*sailStates.p + (-7.692124)*sailStates.q + (-0.023281)*sailStates.r + (0.000026)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end