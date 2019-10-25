function [aeroForces] = paramSpace_1_3_1_3_1_1_1(sailStates,airStates)

	CL = (3.997370)*sailStates.alpha + (0.119918)*sailStates.beta + (-2.292865)*sailStates.p + (35.466450)*sailStates.q + (-1.433721)*sailStates.r + (0.010846)*sailStates.de;
	CD = -0.116230;
	CY = (-0.041081)*sailStates.alpha + (-0.025775)*sailStates.beta + (-0.437600)*sailStates.p + (-0.684401)*sailStates.q + (-0.086971)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.040218)*sailStates.alpha + (0.275471)*sailStates.beta + (-0.965850)*sailStates.p + (8.319445)*sailStates.q + (-1.136895)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-12.333913)*sailStates.alpha + (-0.475057)*sailStates.beta + (7.083292)*sailStates.p + (-128.521423)*sailStates.q + (4.817836)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (-0.120846)*sailStates.alpha + (0.049575)*sailStates.beta + (0.845961)*sailStates.p + (-2.663840)*sailStates.q + (-0.020063)*sailStates.r + (0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end