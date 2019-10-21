function [aeroForces] = paramSpace_1_1_1_2_1_1_1(sailStates,airStates)

	CL = (0.960991)*sailStates.alpha + (0.101470)*sailStates.beta + (-5.854558)*sailStates.p + (56.712841)*sailStates.q + (0.429909)*sailStates.r + (0.011089)*sailStates.de;
	CD = -2.426220;
	CY = (1.213295)*sailStates.alpha + (-0.029003)*sailStates.beta + (0.569322)*sailStates.p + (2.919232)*sailStates.q + (0.100109)*sailStates.r + (0.000661)*sailStates.de;

	Cl = (-1.105816)*sailStates.alpha + (-0.407090)*sailStates.beta + (-4.041420)*sailStates.p + (35.729355)*sailStates.q + (0.744667)*sailStates.r + (0.005376)*sailStates.de;
	Cm = (3.469111)*sailStates.alpha + (-0.415082)*sailStates.beta + (21.293940)*sailStates.p + (-233.820663)*sailStates.q + (-1.305172)*sailStates.r + (-0.081521)*sailStates.de;
	Cn = (-4.585141)*sailStates.alpha + (-0.077835)*sailStates.beta + (-2.087509)*sailStates.p + (10.479935)*sailStates.q + (-0.110858)*sailStates.r + (-0.000541)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end