function [aeroForces] = paramSpace_1_1_1_2_1_1_3(sailStates,airStates)

	CL = (-0.098656)*sailStates.alpha + (0.094173)*sailStates.beta + (-6.185153)*sailStates.p + (59.498684)*sailStates.q + (0.311551)*sailStates.r + (0.011348)*sailStates.de;
	CD = -2.386210;
	CY = (1.261524)*sailStates.alpha + (-0.029317)*sailStates.beta + (0.533033)*sailStates.p + (3.145943)*sailStates.q + (0.093689)*sailStates.r + (0.000717)*sailStates.de;

	Cl = (-1.820649)*sailStates.alpha + (-0.403205)*sailStates.beta + (-4.312530)*sailStates.p + (38.317894)*sailStates.q + (0.647992)*sailStates.r + (0.005875)*sailStates.de;
	Cm = (7.104225)*sailStates.alpha + (-0.390289)*sailStates.beta + (22.369858)*sailStates.p + (-243.043503)*sailStates.q + (-0.908917)*sailStates.r + (-0.083133)*sailStates.de;
	Cn = (-4.943404)*sailStates.alpha + (-0.076416)*sailStates.beta + (-2.059966)*sailStates.p + (10.420403)*sailStates.q + (-0.114590)*sailStates.r + (-0.000603)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end