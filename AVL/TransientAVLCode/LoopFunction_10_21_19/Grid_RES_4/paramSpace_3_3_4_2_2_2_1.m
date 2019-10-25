function [aeroForces] = paramSpace_3_3_4_2_2_2_1(sailStates,airStates)

	CL = (3.972063)*sailStates.alpha + (-0.031557)*sailStates.beta + (-2.164150)*sailStates.p + (31.735073)*sailStates.q + (0.292874)*sailStates.r + (0.010809)*sailStates.de;
	CD = 0.043000;
	CY = (-0.001011)*sailStates.alpha + (-0.025023)*sailStates.beta + (0.081592)*sailStates.p + (0.100923)*sailStates.q + (-0.005337)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (0.995658)*sailStates.alpha + (-0.050357)*sailStates.beta + (-0.862996)*sailStates.p + (6.536942)*sailStates.q + (0.219892)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-14.421283)*sailStates.alpha + (0.144516)*sailStates.beta + (7.409362)*sailStates.p + (-126.149185)*sailStates.q + (-1.023534)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.016047)*sailStates.alpha + (0.003051)*sailStates.beta + (-0.123881)*sailStates.p + (0.236079)*sailStates.q + (-0.002870)*sailStates.r + (-0.000034)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end