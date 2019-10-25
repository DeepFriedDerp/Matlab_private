function [aeroForces] = paramSpace_1_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.451230)*sailStates.alpha + (-0.356074)*sailStates.beta + (-2.163909)*sailStates.p + (34.918110)*sailStates.q + (-1.755127)*sailStates.r + (0.011052)*sailStates.de;
	CD = -0.484990;
	CY = (0.071152)*sailStates.alpha + (-0.024156)*sailStates.beta + (-0.624829)*sailStates.p + (-0.267958)*sailStates.q + (-0.110174)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.227403)*sailStates.alpha + (0.221864)*sailStates.beta + (-0.910394)*sailStates.p + (8.138687)*sailStates.q + (-1.441544)*sailStates.r + (-0.000066)*sailStates.de;
	Cm = (-12.286145)*sailStates.alpha + (1.338563)*sailStates.beta + (6.392286)*sailStates.p + (-123.711861)*sailStates.q + (5.857327)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (-0.445698)*sailStates.alpha + (0.058228)*sailStates.beta + (1.299563)*sailStates.p + (-5.242017)*sailStates.q + (0.003270)*sailStates.r + (-0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end