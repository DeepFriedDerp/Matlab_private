function [aeroForces] = paramSpace_11_1_4_2_2_1_1(sailStates,airStates)

	CL = (4.090186)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.323214)*sailStates.p + (32.301865)*sailStates.q + (-0.144122)*sailStates.r + (0.010603)*sailStates.de;
	CD = -0.075880;
	CY = (0.077137)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.189598)*sailStates.p + (0.493723)*sailStates.q + (0.019980)*sailStates.r + (0.000106)*sailStates.de;

	Cl = (1.185968)*sailStates.alpha + (0.074913)*sailStates.beta + (-1.023291)*sailStates.p + (7.914943)*sailStates.q + (-0.225284)*sailStates.r + (0.000077)*sailStates.de;
	Cm = (-14.841408)*sailStates.alpha + (0.000000)*sailStates.beta + (8.202609)*sailStates.p + (-131.315216)*sailStates.q + (0.440978)*sailStates.r + (-0.069177)*sailStates.de;
	Cn = (-0.303494)*sailStates.alpha + (-0.007874)*sailStates.beta + (0.518722)*sailStates.p + (-3.132952)*sailStates.q + (-0.019862)*sailStates.r + (-0.000199)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end