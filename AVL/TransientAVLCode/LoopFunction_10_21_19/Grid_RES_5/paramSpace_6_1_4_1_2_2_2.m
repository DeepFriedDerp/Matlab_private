function [aeroForces] = paramSpace_6_1_4_1_2_2_2(sailStates,airStates)

	CL = (4.430702)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.031908)*sailStates.p + (37.538322)*sailStates.q + (0.613651)*sailStates.r + (0.011027)*sailStates.de;
	CD = -0.547140;
	CY = (0.213769)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.367418)*sailStates.p + (1.113125)*sailStates.q + (0.025810)*sailStates.r + (0.000242)*sailStates.de;

	Cl = (1.368666)*sailStates.alpha + (-0.228690)*sailStates.beta + (-1.607460)*sailStates.p + (13.251840)*sailStates.q + (0.724998)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.617804)*sailStates.alpha + (0.000000)*sailStates.beta + (10.646239)*sailStates.p + (-150.805054)*sailStates.q + (-2.129405)*sailStates.r + (-0.071596)*sailStates.de;
	Cn = (-0.243424)*sailStates.alpha + (-0.015992)*sailStates.beta + (-0.943946)*sailStates.p + (3.715552)*sailStates.q + (-0.007968)*sailStates.r + (-0.000256)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end