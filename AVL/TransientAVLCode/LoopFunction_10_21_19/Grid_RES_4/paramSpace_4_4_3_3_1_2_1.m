function [aeroForces] = paramSpace_4_4_3_3_1_2_1(sailStates,airStates)

	CL = (3.835775)*sailStates.alpha + (-0.217998)*sailStates.beta + (-2.195834)*sailStates.p + (32.981331)*sailStates.q + (1.007362)*sailStates.r + (0.010310)*sailStates.de;
	CD = 0.051680;
	CY = (-0.068198)*sailStates.alpha + (-0.023817)*sailStates.beta + (0.273985)*sailStates.p + (-0.294836)*sailStates.q + (-0.054510)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.027721)*sailStates.alpha + (-0.184322)*sailStates.beta + (-0.892121)*sailStates.p + (7.282395)*sailStates.q + (0.694634)*sailStates.r + (-0.000159)*sailStates.de;
	Cm = (-13.319218)*sailStates.alpha + (0.811512)*sailStates.beta + (7.127559)*sailStates.p + (-126.097916)*sailStates.q + (-3.381182)*sailStates.r + (-0.065917)*sailStates.de;
	Cn = (0.118415)*sailStates.alpha + (0.024805)*sailStates.beta + (-0.466736)*sailStates.p + (1.862414)*sailStates.q + (-0.010045)*sailStates.r + (0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end