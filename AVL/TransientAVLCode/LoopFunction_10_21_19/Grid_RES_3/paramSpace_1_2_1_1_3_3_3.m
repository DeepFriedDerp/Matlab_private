function [aeroForces] = paramSpace_1_2_1_1_3_3_3(sailStates,airStates)

	CL = (4.807001)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.165451)*sailStates.p + (35.727844)*sailStates.q + (0.615925)*sailStates.r + (0.009660)*sailStates.de;
	CD = -1.448260;
	CY = (0.430044)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.457508)*sailStates.p + (2.260756)*sailStates.q + (0.080456)*sailStates.r + (0.000488)*sailStates.de;

	Cl = (1.314980)*sailStates.alpha + (-0.318916)*sailStates.beta + (-1.803622)*sailStates.p + (14.834019)*sailStates.q + (0.846560)*sailStates.r + (0.001388)*sailStates.de;
	Cm = (-14.075330)*sailStates.alpha + (-0.000000)*sailStates.beta + (11.903469)*sailStates.p + (-157.393341)*sailStates.q + (-1.974001)*sailStates.r + (-0.070740)*sailStates.de;
	Cn = (-0.604349)*sailStates.alpha + (-0.056234)*sailStates.beta + (-1.416797)*sailStates.p + (6.001826)*sailStates.q + (-0.044284)*sailStates.r + (-0.000487)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end