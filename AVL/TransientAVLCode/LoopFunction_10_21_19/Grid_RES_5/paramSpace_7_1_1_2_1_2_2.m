function [aeroForces] = paramSpace_7_1_1_2_1_2_2(sailStates,airStates)

	CL = (4.201350)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.786245)*sailStates.p + (36.364388)*sailStates.q + (0.436571)*sailStates.r + (0.011111)*sailStates.de;
	CD = -0.110760;
	CY = (-0.024824)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.252733)*sailStates.p + (-0.381223)*sailStates.q + (0.008866)*sailStates.r + (-0.000083)*sailStates.de;

	Cl = (1.413660)*sailStates.alpha + (-0.110935)*sailStates.beta + (-1.387547)*sailStates.p + (11.313144)*sailStates.q + (0.418904)*sailStates.r + (0.000635)*sailStates.de;
	Cm = (-14.875192)*sailStates.alpha + (0.000000)*sailStates.beta + (9.622944)*sailStates.p + (-143.525848)*sailStates.q + (-1.447335)*sailStates.r + (-0.071036)*sailStates.de;
	Cn = (0.097706)*sailStates.alpha + (-0.003874)*sailStates.beta + (-0.614774)*sailStates.p + (3.362207)*sailStates.q + (-0.005463)*sailStates.r + (0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end