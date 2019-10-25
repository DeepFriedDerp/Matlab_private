function [aeroForces] = paramSpace_1_3_4_3_3_1_1(sailStates,airStates)

	CL = (4.351873)*sailStates.alpha + (0.110726)*sailStates.beta + (-2.265934)*sailStates.p + (35.482552)*sailStates.q + (-1.659871)*sailStates.r + (0.011103)*sailStates.de;
	CD = -0.249500;
	CY = (0.101311)*sailStates.alpha + (-0.024693)*sailStates.beta + (-0.550010)*sailStates.p + (0.294835)*sailStates.q + (-0.109372)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.258279)*sailStates.alpha + (0.297935)*sailStates.beta + (-0.948834)*sailStates.p + (8.363760)*sailStates.q + (-1.272910)*sailStates.r + (-0.000073)*sailStates.de;
	Cm = (-13.101408)*sailStates.alpha + (-0.381147)*sailStates.beta + (6.775655)*sailStates.p + (-127.124184)*sailStates.q + (5.488183)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (-0.335644)*sailStates.alpha + (0.051564)*sailStates.beta + (1.109144)*sailStates.p + (-4.858160)*sailStates.q + (0.004658)*sailStates.r + (-0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end