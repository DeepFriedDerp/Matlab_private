function [aeroForces] = paramSpace_9_1_1_2_2_2_2(sailStates,airStates)

	CL = (4.147106)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.801646)*sailStates.p + (37.023392)*sailStates.q + (0.608546)*sailStates.r + (0.011299)*sailStates.de;
	CD = -0.070860;
	CY = (0.066574)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.210172)*sailStates.p + (0.381223)*sailStates.q + (-0.007380)*sailStates.r + (0.000083)*sailStates.de;

	Cl = (1.339435)*sailStates.alpha + (-0.120519)*sailStates.beta + (-1.392491)*sailStates.p + (11.492972)*sailStates.q + (0.512686)*sailStates.r + (0.000635)*sailStates.de;
	Cm = (-14.579799)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.501195)*sailStates.p + (-143.525848)*sailStates.q + (-2.039092)*sailStates.r + (-0.071036)*sailStates.de;
	Cn = (-0.076704)*sailStates.alpha + (0.004209)*sailStates.beta + (-0.458205)*sailStates.p + (1.787403)*sailStates.q + (-0.000405)*sailStates.r + (-0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end