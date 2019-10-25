function [aeroForces] = paramSpace_1_2_2_2_3_3_2(sailStates,airStates)

	CL = (4.130277)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.413689)*sailStates.p + (32.147289)*sailStates.q + (-0.056340)*sailStates.r + (0.010109)*sailStates.de;
	CD = -0.241510;
	CY = (0.091249)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.151129)*sailStates.p + (0.759371)*sailStates.q + (0.026648)*sailStates.r + (0.000162)*sailStates.de;

	Cl = (1.197300)*sailStates.alpha + (-0.105855)*sailStates.beta + (-1.140388)*sailStates.p + (9.076750)*sailStates.q + (0.182848)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-14.953794)*sailStates.alpha + (0.000000)*sailStates.beta + (8.680156)*sailStates.p + (-134.568695)*sailStates.q + (0.224839)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.169083)*sailStates.alpha + (-0.018665)*sailStates.beta + (-0.539610)*sailStates.p + (2.469584)*sailStates.q + (-0.027451)*sailStates.r + (-0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end