function [aeroForces] = paramSpace_4_1_1_3_3_3_3(sailStates,airStates)

	CL = (3.997931)*sailStates.alpha + (0.322498)*sailStates.beta + (-2.777542)*sailStates.p + (39.326366)*sailStates.q + (1.602221)*sailStates.r + (0.011193)*sailStates.de;
	CD = -0.126720;
	CY = (0.089745)*sailStates.alpha + (-0.023940)*sailStates.beta + (0.454550)*sailStates.p + (0.294836)*sailStates.q + (-0.090447)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.321579)*sailStates.alpha + (-0.129029)*sailStates.beta + (-1.432559)*sailStates.p + (12.993225)*sailStates.q + (1.239122)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-12.690179)*sailStates.alpha + (-1.112454)*sailStates.beta + (8.669397)*sailStates.p + (-141.543869)*sailStates.q + (-5.316423)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (-0.347425)*sailStates.alpha + (0.044331)*sailStates.beta + (-0.813184)*sailStates.p + (2.569664)*sailStates.q + (-0.028262)*sailStates.r + (0.000013)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end