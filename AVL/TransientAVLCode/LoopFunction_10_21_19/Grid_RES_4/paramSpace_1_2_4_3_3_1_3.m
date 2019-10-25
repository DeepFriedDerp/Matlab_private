function [aeroForces] = paramSpace_1_2_4_3_3_1_3(sailStates,airStates)

	CL = (4.347410)*sailStates.alpha + (-0.119873)*sailStates.beta + (-2.767511)*sailStates.p + (39.755676)*sailStates.q + (-1.860419)*sailStates.r + (0.011354)*sailStates.de;
	CD = -0.252220;
	CY = (0.024858)*sailStates.alpha + (-0.025633)*sailStates.beta + (-0.611720)*sailStates.p + (0.684399)*sailStates.q + (-0.121605)*sailStates.r + (0.000146)*sailStates.de;

	Cl = (1.537927)*sailStates.alpha + (0.237088)*sailStates.beta + (-1.392001)*sailStates.p + (12.724157)*sailStates.q + (-1.443608)*sailStates.r + (0.000675)*sailStates.de;
	Cm = (-13.192801)*sailStates.alpha + (0.411597)*sailStates.beta + (8.396229)*sailStates.p + (-141.172913)*sailStates.q + (6.151372)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (0.212187)*sailStates.alpha + (0.055804)*sailStates.beta + (1.149878)*sailStates.p + (-4.881420)*sailStates.q + (-0.003729)*sailStates.r + (-0.000315)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end