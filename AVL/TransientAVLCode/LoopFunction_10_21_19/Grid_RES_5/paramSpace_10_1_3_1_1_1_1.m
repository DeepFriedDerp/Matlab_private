function [aeroForces] = paramSpace_10_1_3_1_1_1_1(sailStates,airStates)

	CL = (4.379461)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.011374)*sailStates.p + (29.302870)*sailStates.q + (-0.738292)*sailStates.r + (0.010475)*sailStates.de;
	CD = -0.527750;
	CY = (-0.021369)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.381494)*sailStates.p + (-0.839977)*sailStates.q + (0.026647)*sailStates.r + (-0.000180)*sailStates.de;

	Cl = (0.907288)*sailStates.alpha + (0.224686)*sailStates.beta + (-0.773907)*sailStates.p + (5.516083)*sailStates.q + (-0.793241)*sailStates.r + (-0.000346)*sailStates.de;
	Cm = (-14.653383)*sailStates.alpha + (0.000000)*sailStates.beta + (7.235711)*sailStates.p + (-122.784714)*sailStates.q + (2.501751)*sailStates.r + (-0.068758)*sailStates.de;
	Cn = (-0.489313)*sailStates.alpha + (-0.015712)*sailStates.beta + (0.931836)*sailStates.p + (-3.765269)*sailStates.q + (-0.005874)*sailStates.r + (0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end