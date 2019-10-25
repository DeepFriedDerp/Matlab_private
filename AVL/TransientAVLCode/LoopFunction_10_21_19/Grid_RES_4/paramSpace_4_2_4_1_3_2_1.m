function [aeroForces] = paramSpace_4_2_4_1_3_2_1(sailStates,airStates)

	CL = (3.573202)*sailStates.alpha + (0.043279)*sailStates.beta + (-1.676328)*sailStates.p + (27.815220)*sailStates.q + (0.228219)*sailStates.r + (0.010125)*sailStates.de;
	CD = 0.055310;
	CY = (0.325489)*sailStates.alpha + (-0.022260)*sailStates.beta + (-0.126613)*sailStates.p + (2.326709)*sailStates.q + (0.025435)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (0.624902)*sailStates.alpha + (-0.027882)*sailStates.beta + (-0.509481)*sailStates.p + (3.284921)*sailStates.q + (0.084121)*sailStates.r + (-0.000626)*sailStates.de;
	Cm = (-13.162741)*sailStates.alpha + (-0.194836)*sailStates.beta + (5.977036)*sailStates.p + (-113.341965)*sailStates.q + (-0.859927)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-0.464388)*sailStates.alpha + (0.002378)*sailStates.beta + (0.300800)*sailStates.p + (-3.302315)*sailStates.q + (-0.057043)*sailStates.r + (-0.000691)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end