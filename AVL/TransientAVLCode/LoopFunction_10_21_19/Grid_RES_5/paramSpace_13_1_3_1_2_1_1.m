function [aeroForces] = paramSpace_13_1_3_1_2_1_1(sailStates,airStates)

	CL = (4.661998)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.944328)*sailStates.p + (26.873480)*sailStates.q + (-0.834758)*sailStates.r + (0.009678)*sailStates.de;
	CD = -0.790400;
	CY = (0.275778)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.600138)*sailStates.p + (1.304045)*sailStates.q + (0.105867)*sailStates.r + (0.000275)*sailStates.de;

	Cl = (1.281074)*sailStates.alpha + (0.248055)*sailStates.beta + (-0.756021)*sailStates.p + (4.887432)*sailStates.q + (-0.934820)*sailStates.r + (-0.000257)*sailStates.de;
	Cm = (-15.973209)*sailStates.alpha + (0.000000)*sailStates.beta + (7.747505)*sailStates.p + (-122.917580)*sailStates.q + (2.694808)*sailStates.r + (-0.067165)*sailStates.de;
	Cn = (-1.024593)*sailStates.alpha + (-0.043739)*sailStates.beta + (1.434339)*sailStates.p + (-7.758140)*sailStates.q + (-0.064651)*sailStates.r + (-0.000486)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end