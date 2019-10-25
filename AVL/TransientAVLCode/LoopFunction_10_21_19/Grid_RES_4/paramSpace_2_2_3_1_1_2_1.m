function [aeroForces] = paramSpace_2_2_3_1_1_2_1(sailStates,airStates)

	CL = (3.870806)*sailStates.alpha + (0.006091)*sailStates.beta + (-1.699087)*sailStates.p + (27.699514)*sailStates.q + (0.228643)*sailStates.r + (0.010664)*sailStates.de;
	CD = -0.020160;
	CY = (-0.324196)*sailStates.alpha + (-0.024361)*sailStates.beta + (0.241448)*sailStates.p + (-1.915493)*sailStates.q + (0.015758)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (0.727696)*sailStates.alpha + (-0.037306)*sailStates.beta + (-0.512310)*sailStates.p + (3.252162)*sailStates.q + (0.238021)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-14.186092)*sailStates.alpha + (-0.026087)*sailStates.beta + (5.999007)*sailStates.p + (-113.694908)*sailStates.q + (-0.756233)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (0.585742)*sailStates.alpha + (-0.003631)*sailStates.beta + (-0.498661)*sailStates.p + (3.648660)*sailStates.q + (-0.014814)*sailStates.r + (0.000581)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end