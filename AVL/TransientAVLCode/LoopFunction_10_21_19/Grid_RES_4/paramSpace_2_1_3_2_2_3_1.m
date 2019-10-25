function [aeroForces] = paramSpace_2_1_3_2_2_3_1(sailStates,airStates)

	CL = (4.363519)*sailStates.alpha + (0.183992)*sailStates.beta + (-2.118694)*sailStates.p + (30.228411)*sailStates.q + (0.734947)*sailStates.r + (0.010463)*sailStates.de;
	CD = -0.426520;
	CY = (-0.083245)*sailStates.alpha + (-0.024689)*sailStates.beta + (0.425501)*sailStates.p + (-0.100923)*sailStates.q + (0.027885)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (1.192416)*sailStates.alpha + (-0.157966)*sailStates.beta + (-0.910861)*sailStates.p + (6.948306)*sailStates.q + (0.768867)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-14.832105)*sailStates.alpha + (-0.764486)*sailStates.beta + (7.573014)*sailStates.p + (-125.105080)*sailStates.q + (-2.498678)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.501990)*sailStates.alpha + (-0.015401)*sailStates.beta + (-0.995727)*sailStates.p + (4.706509)*sailStates.q + (-0.010997)*sailStates.r + (0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end