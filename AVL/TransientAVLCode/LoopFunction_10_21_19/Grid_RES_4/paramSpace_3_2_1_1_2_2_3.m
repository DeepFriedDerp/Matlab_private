function [aeroForces] = paramSpace_3_2_1_1_2_2_3(sailStates,airStates)

	CL = (3.726330)*sailStates.alpha + (0.017515)*sailStates.beta + (-3.451857)*sailStates.p + (42.111568)*sailStates.q + (0.434381)*sailStates.r + (0.011549)*sailStates.de;
	CD = 0.034080;
	CY = (0.004749)*sailStates.alpha + (-0.025032)*sailStates.beta + (0.088690)*sailStates.p + (-0.221995)*sailStates.q + (-0.005790)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.401585)*sailStates.alpha + (-0.025346)*sailStates.beta + (-1.947298)*sailStates.p + (16.693832)*sailStates.q + (0.287427)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-13.588891)*sailStates.alpha + (-0.032458)*sailStates.beta + (11.715877)*sailStates.p + (-161.490479)*sailStates.q + (-1.430162)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-0.152851)*sailStates.alpha + (0.002139)*sailStates.beta + (-0.093279)*sailStates.p + (0.261096)*sailStates.q + (-0.004688)*sailStates.r + (0.000105)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end