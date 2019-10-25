function [aeroForces] = paramSpace_4_4_1_3_3_3_3(sailStates,airStates)

	CL = (3.997931)*sailStates.alpha + (-0.322498)*sailStates.beta + (-2.777542)*sailStates.p + (39.326363)*sailStates.q + (1.602221)*sailStates.r + (0.011193)*sailStates.de;
	CD = -0.126720;
	CY = (0.089745)*sailStates.alpha + (-0.025633)*sailStates.beta + (0.454550)*sailStates.p + (0.294836)*sailStates.q + (-0.090447)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.200230)*sailStates.alpha + (-0.341453)*sailStates.beta + (-1.338153)*sailStates.p + (11.805346)*sailStates.q + (1.220470)*sailStates.r + (0.000563)*sailStates.de;
	Cm = (-12.690179)*sailStates.alpha + (1.112453)*sailStates.beta + (8.669397)*sailStates.p + (-141.543854)*sailStates.q + (-5.316423)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (-0.258430)*sailStates.alpha + (0.049254)*sailStates.beta + (-0.831963)*sailStates.p + (2.805948)*sailStates.q + (-0.024552)*sailStates.r + (0.000013)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end