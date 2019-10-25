function [aeroForces] = paramSpace_2_4_3_1_1_3_3(sailStates,airStates)

	CL = (6.858341)*sailStates.alpha + (-0.505182)*sailStates.beta + (-3.391052)*sailStates.p + (39.109600)*sailStates.q + (2.222325)*sailStates.r + (0.010812)*sailStates.de;
	CD = -2.800670;
	CY = (0.279027)*sailStates.alpha + (-0.026201)*sailStates.beta + (1.220408)*sailStates.p + (-1.471503)*sailStates.q + (0.079938)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (2.710423)*sailStates.alpha + (-0.689044)*sailStates.beta + (-1.865045)*sailStates.p + (15.082210)*sailStates.q + (2.134068)*sailStates.r + (0.001423)*sailStates.de;
	Cm = (-15.640123)*sailStates.alpha + (2.006480)*sailStates.beta + (12.333419)*sailStates.p + (-161.242615)*sailStates.q + (-7.527610)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (-1.010221)*sailStates.alpha + (-0.029808)*sailStates.beta + (-2.800596)*sailStates.p + (14.190740)*sailStates.q + (-0.035663)*sailStates.r + (0.000683)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end