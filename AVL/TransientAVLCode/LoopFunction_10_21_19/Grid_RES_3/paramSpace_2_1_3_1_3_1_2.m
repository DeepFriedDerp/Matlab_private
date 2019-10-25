function [aeroForces] = paramSpace_2_1_3_1_3_1_2(sailStates,airStates)

	CL = (7.404224)*sailStates.alpha + (-0.489438)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (-2.651040)*sailStates.r + (0.010964)*sailStates.de;
	CD = -2.860320;
	CY = (0.210641)*sailStates.alpha + (-0.024405)*sailStates.beta + (-1.307277)*sailStates.p + (1.697132)*sailStates.q + (0.000159)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (2.839590)*sailStates.alpha + (0.427315)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (-2.408748)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-16.286634)*sailStates.alpha + (1.836869)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (8.970112)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (-0.617318)*sailStates.alpha + (-0.000863)*sailStates.beta + (2.892238)*sailStates.p + (-14.523843)*sailStates.q + (-0.000366)*sailStates.r + (-0.000742)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end