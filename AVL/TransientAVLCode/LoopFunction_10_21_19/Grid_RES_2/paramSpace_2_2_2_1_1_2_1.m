function [aeroForces] = paramSpace_2_2_2_1_1_2_1(sailStates,airStates)

	CL = (5.196091)*sailStates.alpha + (-0.317644)*sailStates.beta + (-2.069995)*sailStates.p + (34.031521)*sailStates.q + (2.075923)*sailStates.r + (0.011137)*sailStates.de;
	CD = -1.010980;
	CY = (-0.286151)*sailStates.alpha + (-0.023788)*sailStates.beta + (0.880599)*sailStates.p + (-0.715007)*sailStates.q + (-0.115984)*sailStates.r + (-0.000151)*sailStates.de;

	Cl = (1.485472)*sailStates.alpha + (-0.496632)*sailStates.beta + (-0.752306)*sailStates.p + (6.371401)*sailStates.q + (1.771001)*sailStates.r + (-0.000447)*sailStates.de;
	Cm = (-12.980858)*sailStates.alpha + (1.237911)*sailStates.beta + (6.055105)*sailStates.p + (-121.082581)*sailStates.q + (-6.980487)*sailStates.r + (-0.067358)*sailStates.de;
	Cn = (1.093079)*sailStates.alpha + (0.049865)*sailStates.beta + (-1.880272)*sailStates.p + (8.783833)*sailStates.q + (0.027347)*sailStates.r + (0.000330)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end