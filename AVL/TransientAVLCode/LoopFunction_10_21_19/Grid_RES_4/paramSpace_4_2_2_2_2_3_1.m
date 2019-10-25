function [aeroForces] = paramSpace_4_2_2_2_2_3_1(sailStates,airStates)

	CL = (4.487515)*sailStates.alpha + (0.137460)*sailStates.beta + (-2.170226)*sailStates.p + (35.557632)*sailStates.q + (1.849263)*sailStates.r + (0.011204)*sailStates.de;
	CD = -0.483140;
	CY = (-0.068745)*sailStates.alpha + (-0.024666)*sailStates.beta + (0.635350)*sailStates.p + (0.301042)*sailStates.q + (-0.126390)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.196036)*sailStates.alpha + (-0.290485)*sailStates.beta + (-0.885405)*sailStates.p + (7.992469)*sailStates.q + (1.489774)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-12.146915)*sailStates.alpha + (-0.504741)*sailStates.beta + (6.256056)*sailStates.p + (-123.990753)*sailStates.q + (-6.135320)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.470662)*sailStates.alpha + (0.066152)*sailStates.beta + (-1.324338)*sailStates.p + (5.338327)*sailStates.q + (0.002121)*sailStates.r + (0.000017)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end