function [aeroForces] = paramSpace_2_2_2_1_2_2_2(sailStates,airStates)

	CL = (5.513305)*sailStates.alpha + (-4.116726)*sailStates.beta + (-3.515391)*sailStates.p + (48.285881)*sailStates.q + (2.279887)*sailStates.r + (0.010530)*sailStates.de;
	CD = -6.592410;
	CY = (1.874414)*sailStates.alpha + (-0.286073)*sailStates.beta + (0.326881)*sailStates.p + (16.325277)*sailStates.q + (-0.031472)*sailStates.r + (0.003112)*sailStates.de;

	Cl = (-6.122698)*sailStates.alpha + (-1.296457)*sailStates.beta + (-1.716250)*sailStates.p + (14.624735)*sailStates.q + (2.557036)*sailStates.r + (0.001301)*sailStates.de;
	Cm = (7.162956)*sailStates.alpha + (18.800800)*sailStates.beta + (10.906859)*sailStates.p + (-153.183548)*sailStates.q + (-8.125182)*sailStates.r + (-0.055481)*sailStates.de;
	Cn = (-1.955700)*sailStates.alpha + (0.407210)*sailStates.beta + (-0.947161)*sailStates.p + (-9.339332)*sailStates.q + (-0.212552)*sailStates.r + (-0.004090)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end