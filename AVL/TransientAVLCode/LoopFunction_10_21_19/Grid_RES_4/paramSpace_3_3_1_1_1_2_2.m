function [aeroForces] = paramSpace_3_3_1_1_1_2_2(sailStates,airStates)

	CL = (4.265834)*sailStates.alpha + (-0.032898)*sailStates.beta + (-2.549982)*sailStates.p + (35.037651)*sailStates.q + (0.762774)*sailStates.r + (0.011083)*sailStates.de;
	CD = -0.039370;
	CY = (-0.215153)*sailStates.alpha + (-0.024552)*sailStates.beta + (0.326970)*sailStates.p + (-1.693497)*sailStates.q + (-0.021252)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.387537)*sailStates.alpha + (-0.111402)*sailStates.beta + (-1.181287)*sailStates.p + (9.613108)*sailStates.q + (0.553057)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-15.050630)*sailStates.alpha + (0.085583)*sailStates.beta + (8.567161)*sailStates.p + (-136.398376)*sailStates.q + (-2.531602)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (0.254051)*sailStates.alpha + (0.005794)*sailStates.beta + (-0.631978)*sailStates.p + (4.030685)*sailStates.q + (0.009703)*sailStates.r + (0.000554)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end