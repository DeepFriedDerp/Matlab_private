function [aeroForces] = paramSpace_2_3_2_1_3_2_2(sailStates,airStates)

	CL = (4.250310)*sailStates.alpha + (0.047384)*sailStates.beta + (-2.549494)*sailStates.p + (35.070797)*sailStates.q + (-0.780227)*sailStates.r + (0.011022)*sailStates.de;
	CD = -0.039870;
	CY = (0.215196)*sailStates.alpha + (-0.024313)*sailStates.beta + (-0.356883)*sailStates.p + (1.693497)*sailStates.q + (-0.023451)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.403944)*sailStates.alpha + (0.126773)*sailStates.beta + (-1.181045)*sailStates.p + (9.614626)*sailStates.q + (-0.600949)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-14.931348)*sailStates.alpha + (-0.177302)*sailStates.beta + (8.560566)*sailStates.p + (-136.398376)*sailStates.q + (2.632231)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.251722)*sailStates.alpha + (0.006420)*sailStates.beta + (0.676150)*sailStates.p + (-4.053860)*sailStates.q + (0.010061)*sailStates.r + (-0.000534)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end