function [aeroForces] = paramSpace_4_4_3_2_2_2_1(sailStates,airStates)

	CL = (3.746505)*sailStates.alpha + (-0.192970)*sailStates.beta + (-2.073542)*sailStates.p + (31.734884)*sailStates.q + (0.826905)*sailStates.r + (0.010249)*sailStates.de;
	CD = 0.066630;
	CY = (0.006723)*sailStates.alpha + (-0.025775)*sailStates.beta + (0.179285)*sailStates.p + (0.301044)*sailStates.q + (-0.035651)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (0.884535)*sailStates.alpha + (-0.147386)*sailStates.beta + (-0.788863)*sailStates.p + (6.175797)*sailStates.q + (0.546647)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-13.231192)*sailStates.alpha + (0.728505)*sailStates.beta + (6.853695)*sailStates.p + (-122.964470)*sailStates.q + (-2.792925)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.046537)*sailStates.alpha + (0.022169)*sailStates.beta + (-0.289670)*sailStates.p + (0.720562)*sailStates.q + (-0.019946)*sailStates.r + (-0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end