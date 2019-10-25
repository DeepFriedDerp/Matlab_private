function [aeroForces] = paramSpace_13_1_4_2_2_1_2(sailStates,airStates)

	CL = (3.893039)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.683661)*sailStates.p + (35.294796)*sailStates.q + (0.321453)*sailStates.r + (0.010396)*sailStates.de;
	CD = -0.014500;
	CY = (0.025139)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.071768)*sailStates.p + (0.261303)*sailStates.q + (0.012683)*sailStates.r + (0.000056)*sailStates.de;

	Cl = (1.306529)*sailStates.alpha + (0.025463)*sailStates.beta + (-1.339756)*sailStates.p + (11.050124)*sailStates.q + (0.111462)*sailStates.r + (0.000636)*sailStates.de;
	Cm = (-14.285175)*sailStates.alpha + (0.000000)*sailStates.beta + (9.419764)*sailStates.p + (-141.841248)*sailStates.q + (-1.154300)*sailStates.r + (-0.069021)*sailStates.de;
	Cn = (-0.238789)*sailStates.alpha + (-0.004490)*sailStates.beta + (0.378954)*sailStates.p + (-2.806996)*sailStates.q + (-0.045112)*sailStates.r + (-0.000125)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end