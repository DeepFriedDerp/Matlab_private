function [aeroForces] = paramSpace_3_4_2_2_2_1_1(sailStates,airStates)

	CL = (4.363519)*sailStates.alpha + (0.183992)*sailStates.beta + (-2.118694)*sailStates.p + (30.228411)*sailStates.q + (-0.734947)*sailStates.r + (0.010463)*sailStates.de;
	CD = -0.426520;
	CY = (0.083245)*sailStates.alpha + (-0.024883)*sailStates.beta + (-0.425501)*sailStates.p + (0.100923)*sailStates.q + (0.027885)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (1.023104)*sailStates.alpha + (0.256968)*sailStates.beta + (-0.813162)*sailStates.p + (5.739743)*sailStates.q + (-0.775228)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-14.832105)*sailStates.alpha + (-0.764486)*sailStates.beta + (7.573014)*sailStates.p + (-125.105080)*sailStates.q + (2.498678)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (-0.545601)*sailStates.alpha + (-0.011795)*sailStates.beta + (0.989323)*sailStates.p + (-4.627295)*sailStates.q + (-0.010580)*sailStates.r + (-0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end