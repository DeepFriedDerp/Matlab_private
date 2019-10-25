function [aeroForces] = paramSpace_11_1_1_1_2_1_2(sailStates,airStates)

	CL = (4.893991)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.021661)*sailStates.p + (36.632515)*sailStates.q + (-0.912998)*sailStates.r + (0.010820)*sailStates.de;
	CD = -0.866540;
	CY = (-0.044011)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.629418)*sailStates.p + (0.768919)*sailStates.q + (0.066073)*sailStates.r + (0.000167)*sailStates.de;

	Cl = (1.793561)*sailStates.alpha + (0.283730)*sailStates.beta + (-1.607728)*sailStates.p + (13.015350)*sailStates.q + (-0.991148)*sailStates.r + (0.001054)*sailStates.de;
	Cm = (-15.583358)*sailStates.alpha + (0.000000)*sailStates.beta + (10.972849)*sailStates.p + (-151.567520)*sailStates.q + (3.093502)*sailStates.r + (-0.071297)*sailStates.de;
	Cn = (0.076249)*sailStates.alpha + (-0.029821)*sailStates.beta + (1.528222)*sailStates.p + (-7.941135)*sailStates.q + (-0.038916)*sailStates.r + (-0.000335)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end