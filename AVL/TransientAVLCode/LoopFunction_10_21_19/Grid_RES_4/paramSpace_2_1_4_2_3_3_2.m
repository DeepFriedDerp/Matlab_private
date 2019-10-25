function [aeroForces] = paramSpace_2_1_4_2_3_3_2(sailStates,airStates)

	CL = (4.294172)*sailStates.alpha + (0.170433)*sailStates.beta + (-2.513413)*sailStates.p + (33.513023)*sailStates.q + (0.490151)*sailStates.r + (0.010676)*sailStates.de;
	CD = -0.332360;
	CY = (0.093618)*sailStates.alpha + (-0.025363)*sailStates.beta + (0.299689)*sailStates.p + (0.769436)*sailStates.q + (0.019724)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.290486)*sailStates.alpha + (-0.147510)*sailStates.beta + (-1.234729)*sailStates.p + (10.009864)*sailStates.q + (0.585589)*sailStates.r + (0.000451)*sailStates.de;
	Cm = (-14.794880)*sailStates.alpha + (-0.781614)*sailStates.beta + (8.830772)*sailStates.p + (-135.788696)*sailStates.q + (-1.702983)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.079893)*sailStates.alpha + (-0.012852)*sailStates.beta + (-0.750338)*sailStates.p + (2.963363)*sailStates.q + (-0.005937)*sailStates.r + (-0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end