function [aeroForces] = paramSpace_2_2_1_1_1_1_2(sailStates,airStates)

	CL = (5.223254)*sailStates.alpha + (-3.794420)*sailStates.beta + (-3.436660)*sailStates.p + (47.159920)*sailStates.q + (2.159437)*sailStates.r + (0.010450)*sailStates.de;
	CD = -5.809630;
	CY = (1.756413)*sailStates.alpha + (-0.245597)*sailStates.beta + (0.293809)*sailStates.p + (15.350381)*sailStates.q + (-0.029983)*sailStates.r + (0.002921)*sailStates.de;

	Cl = (-5.238506)*sailStates.alpha + (-1.211839)*sailStates.beta + (-1.664080)*sailStates.p + (14.113191)*sailStates.q + (2.391630)*sailStates.r + (0.001210)*sailStates.de;
	Cm = (5.080380)*sailStates.alpha + (17.102932)*sailStates.beta + (10.708642)*sailStates.p + (-151.074600)*sailStates.q + (-7.654006)*sailStates.r + (-0.055245)*sailStates.de;
	Cn = (-1.807162)*sailStates.alpha + (0.345026)*sailStates.beta + (-0.868628)*sailStates.p + (-8.777078)*sailStates.q + (-0.193168)*sailStates.r + (-0.003821)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end