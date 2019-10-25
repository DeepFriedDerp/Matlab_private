function [aeroForces] = paramSpace_1_2_3_1_2_2_2(sailStates,airStates)

	CL = (3.966637)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.503580)*sailStates.p + (35.184380)*sailStates.q + (-0.869083)*sailStates.r + (0.010856)*sailStates.de;
	CD = 0.050730;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.178854)*sailStates.p + (-0.000000)*sailStates.q + (-0.031537)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.218317)*sailStates.alpha + (0.089427)*sailStates.beta + (-1.175106)*sailStates.p + (9.885435)*sailStates.q + (-0.572943)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-14.191883)*sailStates.alpha + (0.000000)*sailStates.beta + (8.327961)*sailStates.p + (-135.529190)*sailStates.q + (2.898964)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.104213)*sailStates.alpha + (0.015768)*sailStates.beta + (0.244648)*sailStates.p + (-0.594042)*sailStates.q + (-0.021583)*sailStates.r + (-0.000036)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end