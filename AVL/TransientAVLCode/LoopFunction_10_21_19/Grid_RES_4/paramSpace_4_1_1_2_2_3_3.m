function [aeroForces] = paramSpace_4_1_1_2_2_3_3(sailStates,airStates)

	CL = (4.416138)*sailStates.alpha + (0.431127)*sailStates.beta + (-2.927193)*sailStates.p + (41.845661)*sailStates.q + (2.143707)*sailStates.r + (0.011514)*sailStates.de;
	CD = -0.485510;
	CY = (0.082151)*sailStates.alpha + (-0.025650)*sailStates.beta + (0.714840)*sailStates.p + (-0.301044)*sailStates.q + (-0.142158)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.549997)*sailStates.alpha + (-0.197933)*sailStates.beta + (-1.544473)*sailStates.p + (14.435948)*sailStates.q + (1.722084)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-12.256429)*sailStates.alpha + (-1.515492)*sailStates.beta + (8.707368)*sailStates.p + (-144.677322)*sailStates.q + (-7.090596)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.514542)*sailStates.alpha + (0.068637)*sailStates.beta + (-1.367041)*sailStates.p + (5.401321)*sailStates.q + (-0.009814)*sailStates.r + (0.000233)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end