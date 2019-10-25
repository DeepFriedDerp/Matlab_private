function [aeroForces] = paramSpace_1_1_2_3_1_3_1(sailStates,airStates)

	CL = (4.000329)*sailStates.alpha + (0.000508)*sailStates.beta + (-2.201235)*sailStates.p + (30.728498)*sailStates.q + (0.001067)*sailStates.r + (0.010079)*sailStates.de;
	CD = -0.136050;
	CY = (-0.102235)*sailStates.alpha + (-0.023155)*sailStates.beta + (0.213428)*sailStates.p + (-0.665001)*sailStates.q + (0.037633)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (1.195506)*sailStates.alpha + (-0.078137)*sailStates.beta + (-0.995649)*sailStates.p + (7.801888)*sailStates.q + (0.182092)*sailStates.r + (0.000143)*sailStates.de;
	Cm = (-14.714300)*sailStates.alpha + (-0.027424)*sailStates.beta + (7.971466)*sailStates.p + (-128.181442)*sailStates.q + (0.050493)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (0.400137)*sailStates.alpha + (-0.020257)*sailStates.beta + (-0.611067)*sailStates.p + (3.753606)*sailStates.q + (-0.044684)*sailStates.r + (0.000237)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end