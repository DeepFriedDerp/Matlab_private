function [aeroForces] = paramSpace_10_1_2_2_1_2_1(sailStates,airStates)

	CL = (4.299432)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.364356)*sailStates.p + (33.973789)*sailStates.q + (0.965696)*sailStates.r + (0.011107)*sailStates.de;
	CD = -0.158410;
	CY = (-0.079032)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.383733)*sailStates.p + (-0.351850)*sailStates.q + (-0.026821)*sailStates.r + (-0.000076)*sailStates.de;

	Cl = (1.261168)*sailStates.alpha + (-0.177649)*sailStates.beta + (-1.035704)*sailStates.p + (8.363519)*sailStates.q + (0.797417)*sailStates.r + (0.000053)*sailStates.de;
	Cm = (-14.517401)*sailStates.alpha + (0.000000)*sailStates.beta + (7.865461)*sailStates.p + (-131.203201)*sailStates.q + (-3.257652)*sailStates.r + (-0.069551)*sailStates.de;
	Cn = (0.258728)*sailStates.alpha + (0.012422)*sailStates.beta + (-0.796381)*sailStates.p + (3.733081)*sailStates.q + (0.004949)*sailStates.r + (0.000169)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end