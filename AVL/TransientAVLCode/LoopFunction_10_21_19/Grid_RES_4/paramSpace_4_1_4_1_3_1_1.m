function [aeroForces] = paramSpace_4_1_4_1_3_1_1(sailStates,airStates)

	CL = (6.313483)*sailStates.alpha + (-0.396105)*sailStates.beta + (-1.487542)*sailStates.p + (19.614040)*sailStates.q + (-2.031802)*sailStates.r + (0.008429)*sailStates.de;
	CD = -2.590950;
	CY = (0.663906)*sailStates.alpha + (-0.016657)*sailStates.beta + (-1.160487)*sailStates.p + (2.326709)*sailStates.q + (0.231085)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (1.935084)*sailStates.alpha + (0.341293)*sailStates.beta + (-0.478268)*sailStates.p + (1.510716)*sailStates.q + (-2.003510)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-17.870123)*sailStates.alpha + (1.421991)*sailStates.beta + (7.387503)*sailStates.p + (-112.315697)*sailStates.q + (6.568848)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-2.520605)*sailStates.alpha + (-0.116982)*sailStates.beta + (2.657823)*sailStates.p + (-13.914741)*sailStates.q + (-0.111761)*sailStates.r + (-0.000849)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end