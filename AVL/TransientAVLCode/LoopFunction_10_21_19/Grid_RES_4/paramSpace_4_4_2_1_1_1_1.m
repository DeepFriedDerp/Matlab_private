function [aeroForces] = paramSpace_4_4_2_1_1_1_1(sailStates,airStates)

	CL = (4.675825)*sailStates.alpha + (0.316083)*sailStates.beta + (-1.390152)*sailStates.p + (20.067301)*sailStates.q + (-1.193371)*sailStates.r + (0.008594)*sailStates.de;
	CD = -1.615540;
	CY = (0.143393)*sailStates.alpha + (-0.021700)*sailStates.beta + (-0.659792)*sailStates.p + (-1.002333)*sailStates.q + (0.131277)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (0.273716)*sailStates.alpha + (0.456226)*sailStates.beta + (-0.323279)*sailStates.p + (0.491805)*sailStates.q + (-1.367895)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-14.732705)*sailStates.alpha + (-1.290299)*sailStates.beta + (6.263630)*sailStates.p + (-107.565659)*sailStates.q + (3.897657)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-1.397554)*sailStates.alpha + (-0.068626)*sailStates.beta + (1.565670)*sailStates.p + (-6.126461)*sailStates.q + (-0.026670)*sailStates.r + (0.000167)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end