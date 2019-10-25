function [aeroForces] = paramSpace_1_2_1_2_2_3_3(sailStates,airStates)

	CL = (4.079306)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.823651)*sailStates.p + (35.386688)*sailStates.q + (-0.012121)*sailStates.r + (0.010199)*sailStates.de;
	CD = -0.271430;
	CY = (0.067792)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.209940)*sailStates.p + (0.267956)*sailStates.q + (0.036993)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.393677)*sailStates.alpha + (-0.115657)*sailStates.beta + (-1.472877)*sailStates.p + (12.103701)*sailStates.q + (0.197256)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-14.573083)*sailStates.alpha + (0.000000)*sailStates.beta + (10.171700)*sailStates.p + (-146.430145)*sailStates.q + (0.123056)*sailStates.r + (-0.069510)*sailStates.de;
	Cn = (0.122607)*sailStates.alpha + (-0.020393)*sailStates.beta + (-0.731832)*sailStates.p + (4.106543)*sailStates.q + (-0.048607)*sailStates.r + (0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end