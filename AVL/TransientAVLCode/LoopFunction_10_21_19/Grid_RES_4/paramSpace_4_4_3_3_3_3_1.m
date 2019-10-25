function [aeroForces] = paramSpace_4_4_3_3_3_3_1(sailStates,airStates)

	CL = (3.976863)*sailStates.alpha + (-0.336743)*sailStates.beta + (-2.274633)*sailStates.p + (35.149326)*sailStates.q + (1.418074)*sailStates.r + (0.010770)*sailStates.de;
	CD = -0.127220;
	CY = (0.042228)*sailStates.alpha + (-0.027035)*sailStates.beta + (0.421445)*sailStates.p + (0.684401)*sailStates.q + (-0.083806)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (0.978604)*sailStates.alpha + (-0.322745)*sailStates.beta + (-0.925896)*sailStates.p + (7.846352)*sailStates.q + (1.102169)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-12.338908)*sailStates.alpha + (1.283380)*sailStates.beta + (7.030418)*sailStates.p + (-127.495163)*sailStates.q + (-4.745782)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.148232)*sailStates.alpha + (0.048520)*sailStates.beta + (-0.828013)*sailStates.p + (2.726036)*sailStates.q + (-0.017972)*sailStates.r + (-0.000134)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end