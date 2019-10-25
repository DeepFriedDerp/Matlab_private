function [aeroForces] = paramSpace_3_2_4_1_1_3_1(sailStates,airStates)

	CL = (7.350400)*sailStates.alpha + (0.222292)*sailStates.beta + (-1.722651)*sailStates.p + (30.578386)*sailStates.q + (2.892878)*sailStates.r + (0.011130)*sailStates.de;
	CD = -2.984780;
	CY = (-0.706588)*sailStates.alpha + (-0.025657)*sailStates.beta + (1.385581)*sailStates.p + (-1.471506)*sailStates.q + (-0.090971)*sailStates.r + (-0.000312)*sailStates.de;

	Cl = (2.259629)*sailStates.alpha + (-0.571205)*sailStates.beta + (-0.509248)*sailStates.p + (4.014957)*sailStates.q + (2.610064)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-13.949156)*sailStates.alpha + (-0.883167)*sailStates.beta + (5.111050)*sailStates.p + (-112.102478)*sailStates.q + (-9.812457)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (2.642297)*sailStates.alpha + (0.043691)*sailStates.beta + (-3.027011)*sailStates.p + (14.691853)*sailStates.q + (0.029387)*sailStates.r + (0.000617)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end