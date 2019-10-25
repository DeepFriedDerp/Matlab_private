function [aeroForces] = paramSpace_1_1_3_3_2_3_1(sailStates,airStates)

	CL = (3.899255)*sailStates.alpha + (-0.026751)*sailStates.beta + (-2.160990)*sailStates.p + (30.523397)*sailStates.q + (-0.212706)*sailStates.r + (0.009942)*sailStates.de;
	CD = -0.088490;
	CY = (-0.036738)*sailStates.alpha + (-0.024186)*sailStates.beta + (0.121155)*sailStates.p + (-0.194782)*sailStates.q + (0.024092)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.138222)*sailStates.alpha + (-0.064694)*sailStates.beta + (-0.980027)*sailStates.p + (7.827570)*sailStates.q + (0.025859)*sailStates.r + (0.000127)*sailStates.de;
	Cm = (-14.464005)*sailStates.alpha + (0.036481)*sailStates.beta + (7.736766)*sailStates.p + (-126.796555)*sailStates.q + (0.756615)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (0.297197)*sailStates.alpha + (-0.016396)*sailStates.beta + (-0.427237)*sailStates.p + (2.590752)*sailStates.q + (-0.041097)*sailStates.r + (0.000086)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end