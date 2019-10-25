function [aeroForces] = paramSpace_1_3_3_1_3_1_1(sailStates,airStates)

	CL = (7.403253)*sailStates.alpha + (0.616923)*sailStates.beta + (-1.734441)*sailStates.p + (35.010807)*sailStates.q + (-3.233888)*sailStates.r + (0.011693)*sailStates.de;
	CD = -2.965290;
	CY = (0.684699)*sailStates.alpha + (-0.022373)*sailStates.beta + (-1.386885)*sailStates.p + (1.081939)*sailStates.q + (-0.244442)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (2.215107)*sailStates.alpha + (0.824925)*sailStates.beta + (-0.440401)*sailStates.p + (4.499818)*sailStates.q + (-2.751215)*sailStates.r + (-0.000988)*sailStates.de;
	Cm = (-11.161658)*sailStates.alpha + (-2.265781)*sailStates.beta + (3.650099)*sailStates.p + (-108.520645)*sailStates.q + (10.705861)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-2.703042)*sailStates.alpha + (0.101890)*sailStates.beta + (3.089270)*sailStates.p + (-14.890741)*sailStates.q + (0.073015)*sailStates.r + (-0.000507)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end