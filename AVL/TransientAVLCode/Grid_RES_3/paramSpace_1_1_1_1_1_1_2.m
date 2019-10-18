function [aeroForces] = paramSpace_1_1_1_1_1_1_2(sailStates,airStates)

	CL = (10.225979)*sailStates.alpha + (-1.369829)*sailStates.beta + (-2.279073)*sailStates.p + (42.530022)*sailStates.q + (-4.345945)*sailStates.r + (0.012343)*sailStates.de;
	CD = -6.134200;
	CY = (0.300677)*sailStates.alpha + (-0.023401)*sailStates.beta + (-1.838646)*sailStates.p + (-0.294702)*sailStates.q + (-0.324175)*sailStates.r + (-0.000061)*sailStates.de;

	Cl = (2.789272)*sailStates.alpha + (0.544019)*sailStates.beta + (-0.944801)*sailStates.p + (10.175474)*sailStates.q + (-3.876766)*sailStates.r + (-0.000062)*sailStates.de;
	Cm = (-8.410876)*sailStates.alpha + (5.310373)*sailStates.beta + (4.665979)*sailStates.p + (-121.481117)*sailStates.q + (14.458444)*sailStates.r + (-0.065179)*sailStates.de;
	Cn = (-1.486395)*sailStates.alpha + (0.178252)*sailStates.beta + (4.042366)*sailStates.p + (-17.448105)*sailStates.q + (0.058185)*sailStates.r + (-0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end