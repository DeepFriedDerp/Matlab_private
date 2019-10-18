function [aeroForces] = paramSpace_1_1_2_2_1_2_2(sailStates,airStates)

	CL = (6.621953)*sailStates.alpha + (0.264246)*sailStates.beta + (-2.513978)*sailStates.p + (31.097973)*sailStates.q + (-0.427063)*sailStates.r + (0.009192)*sailStates.de;
	CD = -2.492680;
	CY = (1.631931)*sailStates.alpha + (-0.050280)*sailStates.beta + (-0.527294)*sailStates.p + (13.282505)*sailStates.q + (-0.068479)*sailStates.r + (0.002824)*sailStates.de;

	Cl = (0.384144)*sailStates.alpha + (-0.299044)*sailStates.beta + (-1.376877)*sailStates.p + (11.948080)*sailStates.q + (0.173565)*sailStates.r + (0.000471)*sailStates.de;
	Cm = (-16.123978)*sailStates.alpha + (-1.369068)*sailStates.beta + (8.618607)*sailStates.p + (-135.433578)*sailStates.q + (1.248984)*sailStates.r + (-0.068133)*sailStates.de;
	Cn = (-1.605678)*sailStates.alpha + (-0.014336)*sailStates.beta + (0.624316)*sailStates.p + (-12.125292)*sailStates.q + (0.127274)*sailStates.r + (-0.003802)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end