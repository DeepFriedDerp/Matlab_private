function [aeroForces] = paramSpace_2_1_4_2_1_3_1(sailStates,airStates)

	CL = (4.593394)*sailStates.alpha + (0.233135)*sailStates.beta + (-2.126645)*sailStates.p + (30.169575)*sailStates.q + (0.944005)*sailStates.r + (0.010493)*sailStates.de;
	CD = -0.560380;
	CY = (-0.198587)*sailStates.alpha + (-0.024133)*sailStates.beta + (0.564660)*sailStates.p + (-0.870360)*sailStates.q + (0.036918)*sailStates.r + (-0.000185)*sailStates.de;

	Cl = (1.372499)*sailStates.alpha + (-0.182723)*sailStates.beta + (-0.915793)*sailStates.p + (6.934103)*sailStates.q + (0.956543)*sailStates.r + (-0.000038)*sailStates.de;
	Cm = (-15.275091)*sailStates.alpha + (-0.994775)*sailStates.beta + (7.664388)*sailStates.p + (-125.466835)*sailStates.q + (-3.216049)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (0.700683)*sailStates.alpha + (-0.018574)*sailStates.beta + (-1.272968)*sailStates.p + (6.445791)*sailStates.q + (-0.016988)*sailStates.r + (0.000333)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end