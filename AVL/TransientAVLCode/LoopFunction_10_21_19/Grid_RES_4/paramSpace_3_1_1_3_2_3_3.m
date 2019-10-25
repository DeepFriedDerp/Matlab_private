function [aeroForces] = paramSpace_3_1_1_3_2_3_3(sailStates,airStates)

	CL = (4.200848)*sailStates.alpha + (0.193352)*sailStates.beta + (-2.824794)*sailStates.p + (37.567356)*sailStates.q + (1.003938)*sailStates.r + (0.011203)*sailStates.de;
	CD = -0.175510;
	CY = (0.031892)*sailStates.alpha + (-0.024835)*sailStates.beta + (0.371532)*sailStates.p + (-0.065300)*sailStates.q + (-0.024345)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.463409)*sailStates.alpha + (-0.115441)*sailStates.beta + (-1.465862)*sailStates.p + (12.494136)*sailStates.q + (0.832457)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.158563)*sailStates.alpha + (-0.658086)*sailStates.beta + (9.418956)*sailStates.p + (-143.297119)*sailStates.q + (-3.368689)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (-0.121116)*sailStates.alpha + (0.012396)*sailStates.beta + (-0.764797)*sailStates.p + (3.336620)*sailStates.q + (0.001598)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end