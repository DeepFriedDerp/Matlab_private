function [aeroForces] = paramSpace_4_2_4_3_1_2_1(sailStates,airStates)

	CL = (3.849821)*sailStates.alpha + (0.080161)*sailStates.beta + (-2.214092)*sailStates.p + (33.298412)*sailStates.q + (1.022872)*sailStates.r + (0.010382)*sailStates.de;
	CD = 0.070500;
	CY = (-0.070288)*sailStates.alpha + (-0.025320)*sailStates.beta + (0.290113)*sailStates.p + (-0.294836)*sailStates.q + (-0.057739)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.146650)*sailStates.alpha + (-0.111980)*sailStates.beta + (-0.963607)*sailStates.p + (8.152466)*sailStates.q + (0.735655)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-13.326246)*sailStates.alpha + (-0.317322)*sailStates.beta + (7.180530)*sailStates.p + (-127.124184)*sailStates.q + (-3.452741)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.078759)*sailStates.alpha + (0.026303)*sailStates.beta + (-0.478367)*sailStates.p + (1.721268)*sailStates.q + (-0.013271)*sailStates.r + (0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end