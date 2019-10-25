function [aeroForces] = paramSpace_3_2_2_2_3_3_2(sailStates,airStates)

	CL = (4.394817)*sailStates.alpha + (0.088961)*sailStates.beta + (-2.600859)*sailStates.p + (36.125889)*sailStates.q + (1.137279)*sailStates.r + (0.011301)*sailStates.de;
	CD = -0.358560;
	CY = (0.098199)*sailStates.alpha + (-0.024729)*sailStates.beta + (0.420571)*sailStates.p + (0.769434)*sailStates.q + (-0.027593)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.264393)*sailStates.alpha + (-0.216380)*sailStates.beta + (-1.237573)*sailStates.p + (10.293567)*sailStates.q + (0.997771)*sailStates.r + (0.000405)*sailStates.de;
	Cm = (-14.036043)*sailStates.alpha + (-0.338213)*sailStates.beta + (8.622429)*sailStates.p + (-137.556381)*sailStates.q + (-3.854620)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.007836)*sailStates.alpha + (0.015865)*sailStates.beta + (-0.904918)*sailStates.p + (3.350183)*sailStates.q + (-0.000747)*sailStates.r + (-0.000137)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end