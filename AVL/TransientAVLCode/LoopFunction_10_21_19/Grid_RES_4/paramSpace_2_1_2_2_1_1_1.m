function [aeroForces] = paramSpace_2_1_2_2_1_1_1(sailStates,airStates)

	CL = (4.280015)*sailStates.alpha + (-0.279988)*sailStates.beta + (-2.178895)*sailStates.p + (32.617588)*sailStates.q + (-1.090405)*sailStates.r + (0.010914)*sailStates.de;
	CD = -0.364240;
	CY = (-0.040241)*sailStates.alpha + (-0.023766)*sailStates.beta + (-0.418548)*sailStates.p + (-0.870359)*sailStates.q + (-0.027402)*sailStates.r + (-0.000185)*sailStates.de;

	Cl = (1.072610)*sailStates.alpha + (0.172421)*sailStates.beta + (-0.932229)*sailStates.p + (7.573318)*sailStates.q + (-0.978780)*sailStates.r + (-0.000038)*sailStates.de;
	Cm = (-13.569543)*sailStates.alpha + (1.121854)*sailStates.beta + (7.209919)*sailStates.p + (-125.466835)*sailStates.q + (3.717800)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (-0.278803)*sailStates.alpha + (0.015917)*sailStates.beta + (0.912046)*sailStates.p + (-3.306726)*sailStates.q + (-0.000458)*sailStates.r + (0.000181)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end