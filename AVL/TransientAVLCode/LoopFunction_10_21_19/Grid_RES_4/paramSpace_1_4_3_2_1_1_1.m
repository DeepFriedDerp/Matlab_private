function [aeroForces] = paramSpace_1_4_3_2_1_1_1(sailStates,airStates)

	CL = (4.191759)*sailStates.alpha + (0.382914)*sailStates.beta + (-2.173669)*sailStates.p + (35.164719)*sailStates.q + (-1.648159)*sailStates.r + (0.011042)*sailStates.de;
	CD = -0.361110;
	CY = (-0.051750)*sailStates.alpha + (-0.028041)*sailStates.beta + (-0.513531)*sailStates.p + (-1.057314)*sailStates.q + (-0.102186)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (0.887027)*sailStates.alpha + (0.396880)*sailStates.beta + (-0.827476)*sailStates.p + (7.085253)*sailStates.q + (-1.313284)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-11.808544)*sailStates.alpha + (-1.416475)*sailStates.beta + (6.452839)*sailStates.p + (-124.043571)*sailStates.q + (5.484879)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (-0.349547)*sailStates.alpha + (0.059710)*sailStates.beta + (1.081048)*sailStates.p + (-3.770073)*sailStates.q + (-0.013417)*sailStates.r + (0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end