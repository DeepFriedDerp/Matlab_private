function [aeroForces] = paramSpace_1_1_4_2_1_2_1(sailStates,airStates)

	CL = (3.785092)*sailStates.alpha + (-0.124979)*sailStates.beta + (-2.097087)*sailStates.p + (31.514456)*sailStates.q + (-0.617457)*sailStates.r + (0.010423)*sailStates.de;
	CD = 0.055180;
	CY = (-0.124422)*sailStates.alpha + (-0.021751)*sailStates.beta + (-0.030570)*sailStates.p + (-1.057313)*sailStates.q + (-0.006194)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.015458)*sailStates.alpha + (0.019409)*sailStates.beta + (-0.897772)*sailStates.p + (7.319823)*sailStates.q + (-0.360453)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-13.772685)*sailStates.alpha + (0.378472)*sailStates.beta + (7.130550)*sailStates.p + (-124.043571)*sailStates.q + (2.077799)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.213829)*sailStates.alpha + (0.005524)*sailStates.beta + (-0.025592)*sailStates.p + (1.258836)*sailStates.q + (-0.041384)*sailStates.r + (0.000287)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end