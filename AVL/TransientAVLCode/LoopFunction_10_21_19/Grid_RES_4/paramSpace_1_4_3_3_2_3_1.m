function [aeroForces] = paramSpace_1_4_3_3_2_3_1(sailStates,airStates)

	CL = (3.899255)*sailStates.alpha + (0.026751)*sailStates.beta + (-2.160990)*sailStates.p + (30.523397)*sailStates.q + (-0.212706)*sailStates.r + (0.009942)*sailStates.de;
	CD = -0.088490;
	CY = (-0.036738)*sailStates.alpha + (-0.025386)*sailStates.beta + (0.121155)*sailStates.p + (-0.194782)*sailStates.q + (0.024092)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (0.980775)*sailStates.alpha + (-0.043737)*sailStates.beta + (-0.885638)*sailStates.p + (6.639691)*sailStates.q + (0.044591)*sailStates.r + (-0.000127)*sailStates.de;
	Cm = (-14.464005)*sailStates.alpha + (-0.036481)*sailStates.beta + (7.736766)*sailStates.p + (-126.796555)*sailStates.q + (0.756615)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (0.280218)*sailStates.alpha + (-0.005172)*sailStates.beta + (-0.408462)*sailStates.p + (2.354468)*sailStates.q + (-0.037371)*sailStates.r + (0.000086)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end