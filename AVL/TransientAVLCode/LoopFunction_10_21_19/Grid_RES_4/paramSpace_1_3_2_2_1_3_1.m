function [aeroForces] = paramSpace_1_3_2_2_1_3_1(sailStates,airStates)

	CL = (4.247711)*sailStates.alpha + (-0.023349)*sailStates.beta + (-2.037537)*sailStates.p + (28.276716)*sailStates.q + (0.381948)*sailStates.r + (0.009702)*sailStates.de;
	CD = -0.423750;
	CY = (-0.190389)*sailStates.alpha + (-0.026137)*sailStates.beta + (0.407826)*sailStates.p + (-1.057313)*sailStates.q + (0.081160)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (1.138215)*sailStates.alpha + (-0.172068)*sailStates.beta + (-0.818599)*sailStates.p + (5.656162)*sailStates.q + (0.549240)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-15.345757)*sailStates.alpha + (0.087334)*sailStates.beta + (7.843530)*sailStates.p + (-125.069839)*sailStates.q + (-1.168719)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.709411)*sailStates.alpha + (-0.028667)*sailStates.beta + (-1.034074)*sailStates.p + (5.855062)*sailStates.q + (-0.064119)*sailStates.r + (0.000386)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end