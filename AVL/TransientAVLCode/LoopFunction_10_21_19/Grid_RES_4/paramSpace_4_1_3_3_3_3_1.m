function [aeroForces] = paramSpace_4_1_3_3_3_3_1(sailStates,airStates)

	CL = (3.976863)*sailStates.alpha + (0.336743)*sailStates.beta + (-2.274633)*sailStates.p + (35.149326)*sailStates.q + (1.418074)*sailStates.r + (0.010770)*sailStates.de;
	CD = -0.127220;
	CY = (0.042228)*sailStates.alpha + (-0.022537)*sailStates.beta + (0.421445)*sailStates.p + (0.684401)*sailStates.q + (-0.083806)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.119568)*sailStates.alpha + (-0.145099)*sailStates.beta + (-1.020269)*sailStates.p + (9.034228)*sailStates.q + (1.120983)*sailStates.r + (0.000159)*sailStates.de;
	Cm = (-12.338908)*sailStates.alpha + (-1.283380)*sailStates.beta + (7.030418)*sailStates.p + (-127.495163)*sailStates.q + (-4.745782)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.055628)*sailStates.alpha + (0.044540)*sailStates.beta + (-0.809242)*sailStates.p + (2.489753)*sailStates.q + (-0.021715)*sailStates.r + (-0.000134)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end