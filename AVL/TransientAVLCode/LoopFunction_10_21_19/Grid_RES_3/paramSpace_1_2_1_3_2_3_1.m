function [aeroForces] = paramSpace_1_2_1_3_2_3_1(sailStates,airStates)

	CL = (3.933295)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.204456)*sailStates.p + (31.096603)*sailStates.q + (-0.142072)*sailStates.r + (0.010114)*sailStates.de;
	CD = -0.061390;
	CY = (-0.033569)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.114270)*sailStates.p + (-0.173374)*sailStates.q + (0.020165)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.093371)*sailStates.alpha + (-0.050220)*sailStates.beta + (-0.952819)*sailStates.p + (7.363780)*sailStates.q + (0.050616)*sailStates.r + (0.000003)*sailStates.de;
	Cm = (-14.495064)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.866846)*sailStates.p + (-128.476028)*sailStates.q + (0.544674)*sailStates.r + (-0.067684)*sailStates.de;
	Cn = (0.282492)*sailStates.alpha + (-0.008855)*sailStates.beta + (-0.408224)*sailStates.p + (2.525742)*sailStates.q + (-0.033641)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end