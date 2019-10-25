function [aeroForces] = paramSpace_1_2_1_2_3_1_3(sailStates,airStates)

	CL = (4.760797)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.941583)*sailStates.p + (41.910786)*sailStates.q + (-2.246780)*sailStates.r + (0.011479)*sailStates.de;
	CD = -0.641480;
	CY = (-0.003202)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.852418)*sailStates.p + (1.027328)*sailStates.q + (-0.150402)*sailStates.r + (0.000220)*sailStates.de;

	Cl = (1.793978)*sailStates.alpha + (0.385237)*sailStates.beta + (-1.504068)*sailStates.p + (13.832029)*sailStates.q + (-1.857815)*sailStates.r + (0.000810)*sailStates.de;
	Cm = (-12.725992)*sailStates.alpha + (0.000000)*sailStates.beta + (8.749828)*sailStates.p + (-145.469635)*sailStates.q + (7.510150)*sailStates.r + (-0.069407)*sailStates.de;
	Cn = (0.387340)*sailStates.alpha + (0.067928)*sailStates.beta + (1.656970)*sailStates.p + (-7.217937)*sailStates.q + (0.011237)*sailStates.r + (-0.000424)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end