function [aeroForces] = paramSpace_1_4_4_3_3_1_2(sailStates,airStates)

	CL = (4.316174)*sailStates.alpha + (0.343693)*sailStates.beta + (-2.497838)*sailStates.p + (37.351170)*sailStates.q + (-1.752735)*sailStates.r + (0.011059)*sailStates.de;
	CD = -0.251200;
	CY = (0.065930)*sailStates.alpha + (-0.023380)*sailStates.beta + (-0.579343)*sailStates.p + (0.489617)*sailStates.q + (-0.115186)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.337343)*sailStates.alpha + (0.379742)*sailStates.beta + (-1.114358)*sailStates.p + (9.874645)*sailStates.q + (-1.344047)*sailStates.r + (0.000167)*sailStates.de;
	Cm = (-13.028944)*sailStates.alpha + (-1.181975)*sailStates.beta + (7.523643)*sailStates.p + (-133.122269)*sailStates.q + (5.795115)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.118740)*sailStates.alpha + (0.051153)*sailStates.beta + (1.136801)*sailStates.p + (-4.982877)*sailStates.q + (0.002526)*sailStates.r + (-0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end