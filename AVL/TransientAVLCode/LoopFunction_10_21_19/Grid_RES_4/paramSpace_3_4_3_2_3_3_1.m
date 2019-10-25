function [aeroForces] = paramSpace_3_4_3_2_3_3_1(sailStates,airStates)

	CL = (4.280015)*sailStates.alpha + (-0.279988)*sailStates.beta + (-2.178895)*sailStates.p + (32.617588)*sailStates.q + (1.090405)*sailStates.r + (0.010914)*sailStates.de;
	CD = -0.364240;
	CY = (0.040241)*sailStates.alpha + (-0.025807)*sailStates.beta + (0.418548)*sailStates.p + (0.870359)*sailStates.q + (-0.027402)*sailStates.r + (0.000185)*sailStates.de;

	Cl = (0.911715)*sailStates.alpha + (-0.310882)*sailStates.beta + (-0.834536)*sailStates.p + (6.364759)*sailStates.q + (0.972335)*sailStates.r + (-0.000295)*sailStates.de;
	Cm = (-13.569542)*sailStates.alpha + (1.121854)*sailStates.beta + (7.209920)*sailStates.p + (-125.466835)*sailStates.q + (-3.717800)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (0.353438)*sailStates.alpha + (0.015761)*sailStates.beta + (-0.918450)*sailStates.p + (3.385939)*sailStates.q + (-0.000035)*sailStates.r + (-0.000181)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end