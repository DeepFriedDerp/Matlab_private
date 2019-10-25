function [aeroForces] = paramSpace_3_4_2_1_1_2_2(sailStates,airStates)

	CL = (4.199457)*sailStates.alpha + (-0.119729)*sailStates.beta + (-2.530203)*sailStates.p + (34.788166)*sailStates.q + (0.769015)*sailStates.r + (0.010885)*sailStates.de;
	CD = -0.043050;
	CY = (-0.213561)*sailStates.alpha + (-0.023158)*sailStates.beta + (0.341408)*sailStates.p + (-1.693497)*sailStates.q + (-0.022318)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (1.327028)*sailStates.alpha + (-0.150721)*sailStates.beta + (-1.139447)*sailStates.p + (9.137047)*sailStates.q + (0.573244)*sailStates.r + (0.000171)*sailStates.de;
	Cm = (-14.767736)*sailStates.alpha + (0.391926)*sailStates.beta + (8.497207)*sailStates.p + (-135.354233)*sailStates.q + (-2.573507)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (0.263500)*sailStates.alpha + (0.004785)*sailStates.beta + (-0.655497)*sailStates.p + (4.066921)*sailStates.q + (0.010166)*sailStates.r + (0.000540)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end