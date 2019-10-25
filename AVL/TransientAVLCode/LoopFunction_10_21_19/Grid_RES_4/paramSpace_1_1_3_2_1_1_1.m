function [aeroForces] = paramSpace_1_1_3_2_1_1_1(sailStates,airStates)

	CL = (4.191759)*sailStates.alpha + (-0.382914)*sailStates.beta + (-2.173668)*sailStates.p + (35.164719)*sailStates.q + (-1.648159)*sailStates.r + (0.011042)*sailStates.de;
	CD = -0.361110;
	CY = (-0.051751)*sailStates.alpha + (-0.021531)*sailStates.beta + (-0.513531)*sailStates.p + (-1.057314)*sailStates.q + (-0.102186)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.030201)*sailStates.alpha + (0.191897)*sailStates.beta + (-0.921865)*sailStates.p + (8.273134)*sailStates.q + (-1.332017)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-11.808544)*sailStates.alpha + (1.416475)*sailStates.beta + (6.452839)*sailStates.p + (-124.043571)*sailStates.q + (5.484880)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (-0.239987)*sailStates.alpha + (0.057405)*sailStates.beta + (1.062272)*sailStates.p + (-3.533788)*sailStates.q + (-0.017143)*sailStates.r + (0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end