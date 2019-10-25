function [aeroForces] = paramSpace_1_1_2_1_1_1_2(sailStates,airStates)

	CL = (3.921270)*sailStates.alpha + (0.511592)*sailStates.beta + (-5.375003)*sailStates.p + (52.165581)*sailStates.q + (1.551428)*sailStates.r + (0.010976)*sailStates.de;
	CD = -4.172240;
	CY = (1.597611)*sailStates.alpha + (-0.030802)*sailStates.beta + (0.959329)*sailStates.p + (3.134241)*sailStates.q + (0.126520)*sailStates.r + (0.000703)*sailStates.de;

	Cl = (-0.201183)*sailStates.alpha + (-0.519717)*sailStates.beta + (-3.665099)*sailStates.p + (31.883142)*sailStates.q + (1.756776)*sailStates.r + (0.004643)*sailStates.de;
	Cm = (-1.118632)*sailStates.alpha + (-2.167728)*sailStates.beta + (19.742165)*sailStates.p + (-218.644806)*sailStates.q + (-5.246094)*sailStates.r + (-0.078981)*sailStates.de;
	Cn = (-5.746862)*sailStates.alpha + (-0.088718)*sailStates.beta + (-2.716760)*sailStates.p + (11.945631)*sailStates.q + (-0.063435)*sailStates.r + (-0.000594)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end