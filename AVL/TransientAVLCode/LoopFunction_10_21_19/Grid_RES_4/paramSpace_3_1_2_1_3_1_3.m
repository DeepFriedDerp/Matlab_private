function [aeroForces] = paramSpace_3_1_2_1_3_1_3(sailStates,airStates)

	CL = (6.858341)*sailStates.alpha + (-0.505182)*sailStates.beta + (-3.391052)*sailStates.p + (39.109604)*sailStates.q + (-2.222325)*sailStates.r + (0.010812)*sailStates.de;
	CD = -2.800670;
	CY = (-0.279027)*sailStates.alpha + (-0.023372)*sailStates.beta + (-1.220408)*sailStates.p + (1.471503)*sailStates.q + (0.079938)*sailStates.r + (0.000320)*sailStates.de;

	Cl = (2.832441)*sailStates.alpha + (0.404148)*sailStates.beta + (-1.962743)*sailStates.p + (16.290773)*sailStates.q + (-2.127707)*sailStates.r + (0.001687)*sailStates.de;
	Cm = (-15.640122)*sailStates.alpha + (2.006480)*sailStates.beta + (12.333419)*sailStates.p + (-161.242615)*sailStates.q + (7.527608)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (1.146609)*sailStates.alpha + (-0.041843)*sailStates.beta + (2.806999)*sailStates.p + (-14.269954)*sailStates.q + (-0.036080)*sailStates.r + (-0.000683)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end