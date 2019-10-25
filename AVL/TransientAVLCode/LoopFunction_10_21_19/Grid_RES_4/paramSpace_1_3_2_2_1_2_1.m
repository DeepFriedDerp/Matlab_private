function [aeroForces] = paramSpace_1_3_2_2_1_2_1(sailStates,airStates)

	CL = (3.769065)*sailStates.alpha + (0.056039)*sailStates.beta + (-2.114726)*sailStates.p + (31.879032)*sailStates.q + (-0.640871)*sailStates.r + (0.010411)*sailStates.de;
	CD = 0.073820;
	CY = (-0.120193)*sailStates.alpha + (-0.026137)*sailStates.beta + (-0.060861)*sailStates.p + (-1.057313)*sailStates.q + (-0.012068)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (0.920097)*sailStates.alpha + (0.084330)*sailStates.beta + (-0.843020)*sailStates.p + (6.607250)*sailStates.q + (-0.399246)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-13.573787)*sailStates.alpha + (-0.215875)*sailStates.beta + (7.174781)*sailStates.p + (-125.069839)*sailStates.q + (2.193310)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.170429)*sailStates.alpha + (0.016359)*sailStates.beta + (0.032332)*sailStates.p + (1.073621)*sailStates.q + (-0.039712)*sailStates.r + (0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end