function [aeroForces] = paramSpace_1_3_4_2_1_1_2(sailStates,airStates)

	CL = (4.303868)*sailStates.alpha + (0.128447)*sailStates.beta + (-2.580804)*sailStates.p + (38.686878)*sailStates.q + (-1.802454)*sailStates.r + (0.011485)*sailStates.de;
	CD = -0.356990;
	CY = (-0.102044)*sailStates.alpha + (-0.025702)*sailStates.beta + (-0.548466)*sailStates.p + (-0.756270)*sailStates.q + (-0.109178)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.166290)*sailStates.alpha + (0.342823)*sailStates.beta + (-1.186156)*sailStates.p + (10.616673)*sailStates.q + (-1.428488)*sailStates.r + (0.000340)*sailStates.de;
	Cm = (-12.390420)*sailStates.alpha + (-0.454596)*sailStates.beta + (7.776432)*sailStates.p + (-135.926239)*sailStates.q + (5.976984)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (0.079479)*sailStates.alpha + (0.060959)*sailStates.beta + (1.091758)*sailStates.p + (-3.764274)*sailStates.q + (-0.020176)*sailStates.r + (0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end