function [aeroForces] = paramSpace_2_3_1_2_3_3_2(sailStates,airStates)

	CL = (4.279083)*sailStates.alpha + (-0.035300)*sailStates.beta + (-2.532225)*sailStates.p + (33.828697)*sailStates.q + (0.461630)*sailStates.r + (0.010750)*sailStates.de;
	CD = -0.281930;
	CY = (0.094364)*sailStates.alpha + (-0.024620)*sailStates.beta + (0.254390)*sailStates.p + (0.769435)*sailStates.q + (0.016592)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.215899)*sailStates.alpha + (-0.168320)*sailStates.beta + (-1.178385)*sailStates.p + (9.280396)*sailStates.q + (0.516466)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.828674)*sailStates.alpha + (0.123460)*sailStates.beta + (8.887530)*sailStates.p + (-136.832825)*sailStates.q + (-1.543546)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (0.108734)*sailStates.alpha + (-0.010155)*sailStates.beta + (-0.679231)*sailStates.p + (2.874136)*sailStates.q + (-0.005716)*sailStates.r + (-0.000144)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end