function [aeroForces] = paramSpace_1_1_2_3_3_2_1(sailStates,airStates)

	CL = (3.835775)*sailStates.alpha + (-0.217998)*sailStates.beta + (-2.195834)*sailStates.p + (32.981331)*sailStates.q + (-1.007362)*sailStates.r + (0.010310)*sailStates.de;
	CD = 0.051680;
	CY = (0.068198)*sailStates.alpha + (-0.025755)*sailStates.beta + (-0.273985)*sailStates.p + (0.294836)*sailStates.q + (-0.054510)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.176557)*sailStates.alpha + (0.060192)*sailStates.beta + (-0.986494)*sailStates.p + (8.470278)*sailStates.q + (-0.713449)*sailStates.r + (0.000094)*sailStates.de;
	Cm = (-13.319218)*sailStates.alpha + (0.811512)*sailStates.beta + (7.127559)*sailStates.p + (-126.097916)*sailStates.q + (3.381182)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (-0.054811)*sailStates.alpha + (0.023832)*sailStates.beta + (0.447964)*sailStates.p + (-1.626130)*sailStates.q + (-0.013788)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end