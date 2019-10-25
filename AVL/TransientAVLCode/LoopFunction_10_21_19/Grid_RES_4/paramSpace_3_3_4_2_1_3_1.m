function [aeroForces] = paramSpace_3_3_4_2_1_3_1(sailStates,airStates)

	CL = (4.780218)*sailStates.alpha + (-0.119554)*sailStates.beta + (-2.182733)*sailStates.p + (32.985218)*sailStates.q + (1.503016)*sailStates.r + (0.011049)*sailStates.de;
	CD = -0.613050;
	CY = (-0.200463)*sailStates.alpha + (-0.024667)*sailStates.beta + (0.682824)*sailStates.p + (-0.668513)*sailStates.q + (-0.044825)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.361917)*sailStates.alpha + (-0.346010)*sailStates.beta + (-0.866506)*sailStates.p + (6.869232)*sailStates.q + (1.328237)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.237352)*sailStates.alpha + (0.484756)*sailStates.beta + (7.096850)*sailStates.p + (-125.787453)*sailStates.q + (-5.114831)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.735631)*sailStates.alpha + (0.019648)*sailStates.beta + (-1.450037)*sailStates.p + (6.828460)*sailStates.q + (0.011497)*sailStates.r + (0.000288)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end