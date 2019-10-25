function [aeroForces] = paramSpace_15_1_2_2_1_2_2(sailStates,airStates)

	CL = (4.139565)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.668332)*sailStates.p + (39.705318)*sailStates.q + (1.965034)*sailStates.r + (0.011032)*sailStates.de;
	CD = -0.151870;
	CY = (-0.025543)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.605598)*sailStates.p + (-0.596614)*sailStates.q + (-0.150971)*sailStates.r + (-0.000126)*sailStates.de;

	Cl = (1.432862)*sailStates.alpha + (-0.279349)*sailStates.beta + (-1.310242)*sailStates.p + (12.275398)*sailStates.q + (1.498103)*sailStates.r + (0.000561)*sailStates.de;
	Cm = (-12.393689)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.856818)*sailStates.p + (-138.535995)*sailStates.q + (-6.470471)*sailStates.r + (-0.066877)*sailStates.de;
	Cn = (-0.208540)*sailStates.alpha + (0.069649)*sailStates.beta + (-1.100346)*sailStates.p + (4.311801)*sailStates.q + (-0.017783)*sailStates.r + (0.000269)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end