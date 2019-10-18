function [aeroForces] = paramSpace_1_1_2_1_1_1_1(sailStates,airStates)

	CL = (5.891374)*sailStates.alpha + (0.262358)*sailStates.beta + (-2.532891)*sailStates.p + (31.341253)*sailStates.q + (-0.203738)*sailStates.r + (0.009344)*sailStates.de;
	CD = -2.069540;
	CY = (1.358580)*sailStates.alpha + (-0.046073)*sailStates.beta + (-0.338949)*sailStates.p + (11.090751)*sailStates.q + (-0.043838)*sailStates.r + (0.002359)*sailStates.de;

	Cl = (0.351226)*sailStates.alpha + (-0.290280)*sailStates.beta + (-1.374800)*sailStates.p + (11.765466)*sailStates.q + (0.316257)*sailStates.r + (0.000512)*sailStates.de;
	Cm = (-15.160768)*sailStates.alpha + (-1.320433)*sailStates.beta + (8.821196)*sailStates.p + (-136.308395)*sailStates.q + (0.530208)*sailStates.r + (-0.068221)*sailStates.de;
	Cn = (-1.311453)*sailStates.alpha + (-0.019686)*sailStates.beta + (0.268043)*sailStates.p + (-8.893114)*sailStates.q + (0.099360)*sailStates.r + (-0.003156)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end