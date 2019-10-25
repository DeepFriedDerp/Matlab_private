function [aeroForces] = paramSpace_2_2_4_1_3_2_2(sailStates,airStates)

	CL = (4.265834)*sailStates.alpha + (-0.032898)*sailStates.beta + (-2.549982)*sailStates.p + (35.037651)*sailStates.q + (-0.762774)*sailStates.r + (0.011083)*sailStates.de;
	CD = -0.039370;
	CY = (0.215152)*sailStates.alpha + (-0.025401)*sailStates.beta + (-0.326970)*sailStates.p + (1.693497)*sailStates.q + (-0.021252)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.437762)*sailStates.alpha + (0.078378)*sailStates.beta + (-1.213939)*sailStates.p + (10.016982)*sailStates.q + (-0.555154)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-15.050631)*sailStates.alpha + (0.085583)*sailStates.beta + (8.567161)*sailStates.p + (-136.398376)*sailStates.q + (2.531603)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.242434)*sailStates.alpha + (0.006645)*sailStates.beta + (0.629838)*sailStates.p + (-4.004214)*sailStates.q + (0.009565)*sailStates.r + (-0.000554)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end