function [aeroForces] = paramSpace_2_1_4_2_2_1_2(sailStates,airStates)

	CL = (4.225392)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.706661)*sailStates.p + (39.159912)*sailStates.q + (-1.773403)*sailStates.r + (0.011240)*sailStates.de;
	CD = -0.158810;
	CY = (0.026416)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.553504)*sailStates.p + (0.571903)*sailStates.q + (-0.117589)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.443876)*sailStates.alpha + (0.254087)*sailStates.beta + (-1.332325)*sailStates.p + (12.123722)*sailStates.q + (-1.347662)*sailStates.r + (0.000575)*sailStates.de;
	Cm = (-13.161987)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.238615)*sailStates.p + (-139.762878)*sailStates.q + (5.855875)*sailStates.r + (-0.067975)*sailStates.de;
	Cn = (0.167917)*sailStates.alpha + (0.054008)*sailStates.beta + (1.019649)*sailStates.p + (-4.204055)*sailStates.q + (-0.009894)*sailStates.r + (-0.000270)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end