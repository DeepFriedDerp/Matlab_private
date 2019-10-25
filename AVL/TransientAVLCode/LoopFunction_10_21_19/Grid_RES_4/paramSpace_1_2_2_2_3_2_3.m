function [aeroForces] = paramSpace_1_2_2_2_3_2_3(sailStates,airStates)

	CL = (3.903292)*sailStates.alpha + (-0.088420)*sailStates.beta + (-2.844865)*sailStates.p + (38.733761)*sailStates.q + (-1.340416)*sailStates.r + (0.010783)*sailStates.de;
	CD = 0.047620;
	CY = (0.069861)*sailStates.alpha + (-0.026137)*sailStates.beta + (-0.396969)*sailStates.p + (1.057312)*sailStates.q + (-0.079000)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (1.451336)*sailStates.alpha + (0.125485)*sailStates.beta + (-1.482797)*sailStates.p + (13.208592)*sailStates.q + (-0.978939)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-13.464502)*sailStates.alpha + (0.323617)*sailStates.beta + (9.158507)*sailStates.p + (-144.624481)*sailStates.q + (4.483710)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (0.235093)*sailStates.alpha + (0.030962)*sailStates.beta + (0.606382)*sailStates.p + (-2.446536)*sailStates.q + (-0.015409)*sailStates.r + (-0.000349)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end