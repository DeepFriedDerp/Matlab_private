function [aeroForces] = paramSpace_2_1_1_1_2_1_1(sailStates,airStates)

	CL = (5.171086)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.053859)*sailStates.p + (36.284889)*sailStates.q + (-2.397753)*sailStates.r + (0.011178)*sailStates.de;
	CD = -1.015470;
	CY = (0.285983)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.938036)*sailStates.p + (0.550481)*sailStates.q + (-0.199445)*sailStates.r + (0.000115)*sailStates.de;

	Cl = (1.573333)*sailStates.alpha + (0.447215)*sailStates.beta + (-0.769681)*sailStates.p + (7.389840)*sailStates.q + (-1.989869)*sailStates.r + (-0.000377)*sailStates.de;
	Cm = (-11.310728)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.251675)*sailStates.p + (-119.415161)*sailStates.q + (7.934623)*sailStates.r + (-0.066020)*sailStates.de;
	Cn = (-1.046916)*sailStates.alpha + (0.095058)*sailStates.beta + (1.987417)*sailStates.p + (-8.873763)*sailStates.q + (0.034021)*sailStates.r + (-0.000283)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end