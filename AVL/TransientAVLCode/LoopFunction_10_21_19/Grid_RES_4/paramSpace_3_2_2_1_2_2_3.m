function [aeroForces] = paramSpace_3_2_2_1_2_2_3(sailStates,airStates)

	CL = (3.719607)*sailStates.alpha + (0.024920)*sailStates.beta + (-3.451523)*sailStates.p + (42.128407)*sailStates.q + (0.444571)*sailStates.r + (0.011518)*sailStates.de;
	CD = 0.031090;
	CY = (0.010335)*sailStates.alpha + (-0.025048)*sailStates.beta + (0.103898)*sailStates.p + (-0.221995)*sailStates.q + (-0.006802)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.400882)*sailStates.alpha + (-0.032320)*sailStates.beta + (-1.947146)*sailStates.p + (16.694578)*sailStates.q + (0.312211)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-13.520218)*sailStates.alpha + (-0.079152)*sailStates.beta + (11.711986)*sailStates.p + (-161.490479)*sailStates.q + (-1.489515)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-0.171593)*sailStates.alpha + (0.002644)*sailStates.beta + (-0.115729)*sailStates.p + (0.272471)*sailStates.q + (-0.004558)*sailStates.r + (0.000089)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end