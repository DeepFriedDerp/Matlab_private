function [aeroForces] = paramSpace_3_1_2_2_1_2_1(sailStates,airStates)

	CL = (3.967905)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.268353)*sailStates.p + (31.746796)*sailStates.q + (-0.164329)*sailStates.r + (0.010274)*sailStates.de;
	CD = -0.053860;
	CY = (-0.077837)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.131989)*sailStates.p + (-0.546500)*sailStates.q + (0.023293)*sailStates.r + (-0.000116)*sailStates.de;

	Cl = (1.135441)*sailStates.alpha + (-0.044196)*sailStates.beta + (-0.998995)*sailStates.p + (7.791759)*sailStates.q + (0.033629)*sailStates.r + (0.000086)*sailStates.de;
	Cm = (-14.628514)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.074748)*sailStates.p + (-130.238892)*sailStates.q + (0.607673)*sailStates.r + (-0.067853)*sailStates.de;
	Cn = (0.318905)*sailStates.alpha + (-0.007793)*sailStates.beta + (-0.435494)*sailStates.p + (2.893199)*sailStates.q + (-0.039849)*sailStates.r + (0.000197)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end