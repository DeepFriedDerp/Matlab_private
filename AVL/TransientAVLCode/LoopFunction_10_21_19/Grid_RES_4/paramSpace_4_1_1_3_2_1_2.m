function [aeroForces] = paramSpace_4_1_1_3_2_1_2(sailStates,airStates)

	CL = (3.957085)*sailStates.alpha + (0.019886)*sailStates.beta + (-2.412422)*sailStates.p + (32.611942)*sailStates.q + (0.304898)*sailStates.r + (0.010146)*sailStates.de;
	CD = -0.091680;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.104589)*sailStates.p + (-0.000000)*sailStates.q + (0.020804)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.266470)*sailStates.alpha + (0.072744)*sailStates.beta + (-1.186178)*sailStates.p + (9.807067)*sailStates.q + (0.033193)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-14.667061)*sailStates.alpha + (0.048914)*sailStates.beta + (8.556206)*sailStates.p + (-133.820877)*sailStates.q + (-1.042182)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.240353)*sailStates.alpha + (-0.016572)*sailStates.beta + (0.425216)*sailStates.p + (-2.550802)*sailStates.q + (-0.044572)*sailStates.r + (-0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end