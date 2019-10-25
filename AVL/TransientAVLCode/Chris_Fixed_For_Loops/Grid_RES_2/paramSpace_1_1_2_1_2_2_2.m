function [aeroForces] = paramSpace_1_1_2_1_2_2_2(sailStates,airStates)

	CL = (5.227349)*sailStates.alpha + (0.810628)*sailStates.beta + (-6.386574)*sailStates.p + (57.658810)*sailStates.q + (2.651201)*sailStates.r + (0.011044)*sailStates.de;
	CD = -9.069680;
	CY = (3.097821)*sailStates.alpha + (-0.033089)*sailStates.beta + (1.494025)*sailStates.p + (4.325972)*sailStates.q + (0.196999)*sailStates.r + (0.000989)*sailStates.de;

	Cl = (-1.899495)*sailStates.alpha + (-0.767663)*sailStates.beta + (-4.535481)*sailStates.p + (39.431534)*sailStates.q + (2.834083)*sailStates.r + (0.006255)*sailStates.de;
	Cm = (11.564684)*sailStates.alpha + (-3.363789)*sailStates.beta + (23.925653)*sailStates.p + (-248.596329)*sailStates.q + (-8.948283)*sailStates.r + (-0.084110)*sailStates.de;
	Cn = (-12.147810)*sailStates.alpha + (-0.133598)*sailStates.beta + (-4.077802)*sailStates.p + (17.777834)*sailStates.q + (-0.085881)*sailStates.r + (-0.000704)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end