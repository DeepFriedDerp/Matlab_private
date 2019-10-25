function [aeroForces] = paramSpace_4_2_4_3_3_3_1(sailStates,airStates)

	CL = (3.997370)*sailStates.alpha + (0.119918)*sailStates.beta + (-2.292865)*sailStates.p + (35.466450)*sailStates.q + (1.433721)*sailStates.r + (0.010846)*sailStates.de;
	CD = -0.116230;
	CY = (0.041081)*sailStates.alpha + (-0.024177)*sailStates.beta + (0.437600)*sailStates.p + (0.684401)*sailStates.q + (-0.086971)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.087426)*sailStates.alpha + (-0.215561)*sailStates.beta + (-0.997382)*sailStates.p + (8.716414)*sailStates.q + (1.143210)*sailStates.r + (0.000078)*sailStates.de;
	Cm = (-12.333913)*sailStates.alpha + (-0.475056)*sailStates.beta + (7.083292)*sailStates.p + (-128.521423)*sailStates.q + (-4.817835)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.089147)*sailStates.alpha + (0.048097)*sailStates.beta + (-0.839688)*sailStates.p + (2.584878)*sailStates.q + (-0.021319)*sailStates.r + (-0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end